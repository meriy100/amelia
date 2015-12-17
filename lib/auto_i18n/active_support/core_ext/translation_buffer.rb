class TranslationBuffer < String
  class TranslationConcatError < StandardError
    def initialize
      super 'Could not concatenate to the buffer because it is not html safe.'
    end
  end
  def initialize(*)
    @translate_flag = true
    @options = {}
    super
  end
  def translate_flag?
    defined?(@translate_flag) && @translate_flag
  end

  def internationalization_options options = {}
    @options = options
    self
  end

  alias :io :internationalization_options

  def translate_false
    @translate_flag = false
    self
  end

  def internationalization virtual_path = nil
    @virtual_path = virtual_path
    translate_flag? ? translate(self, @options).translate_false : self
  end

  alias :i18n :internationalization

  def to_s
    # これをやらないと to_s した時に String に戻る
    self
  end

  private
    def translate(key, options = {})
      options = options.dup
      has_default = options.has_key?(:default)
      remaining_defaults = Array(options.delete(:default)).compact

      if has_default && !remaining_defaults.first.kind_of?(Symbol)
        options[:default] = remaining_defaults
      end

      # If the user has explicitly decided to NOT raise errors, pass that option to I18n.
      # Otherwise, tell I18n to raise an exception, which we rescue further in this method.
      # Note: `raise_error` refers to us re-raising the error in this method. I18n is forced to raise by default.
      if options[:raise] == false || (options.key?(:rescue_format) && options[:rescue_format].nil?)
        raise_error = false
        i18n_raise = false
      else
        raise_error = options[:raise] || options[:rescue_format] || ActionView::Base.raise_on_missing_translations
        i18n_raise = true
      end

      if key.to_s =~ /(\b|_|\.)html$/
        html_safe_options = options.dup
        options.except(*I18n::RESERVED_KEYS).each do |name, value|
          unless name == :count && value.is_a?(Numeric)
            html_safe_options[name] = ERB::Util.html_escape(value.to_s)
          end
        end
        translation = I18n.translate(scope_key_by_partial(key), html_safe_options.merge(raise: i18n_raise))

        translation.respond_to?(:html_safe) ? translation.html_safe : translation
      else
        I18n.translate(scope_key_by_partial(key), options.merge(raise: i18n_raise))
      end
    rescue I18n::MissingTranslationData => e
      if remaining_defaults.present?
        translate remaining_defaults.shift, options.merge(default: remaining_defaults)
      else
        raise e if raise_error

        keys = I18n.normalize_keys(e.locale, e.key, e.options[:scope])
        keys.last.to_s
      end
    rescue I18n::ArgumentError => e
      key
    end

    alias :t :translate

    def scope_key_by_partial(key)
      if key.to_s.first == "."
        if @virtual_path
          @virtual_path.gsub(%r{/_?}, ".") + key.to_s
        else
          raise "Cannot use t(#{key.inspect}) shortcut because path is not available"
        end
      else
        key
      end
    end
end

