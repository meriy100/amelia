require 'erb'
require 'active_support/core_ext/kernel/singleton_class'
require 'active_support/deprecation'


class Object
  def html_safe?
    false
  end
#
  def internationalization
    self
  end
#
# alias :i18n :internationalization

  def translate_flag?
    true
  end
end

class Numeric
  def html_safe?
    false
  end
#
#  def internationalization
#    self
#  end
#
# alias :i18n :internationalization

  def translate_flag?
    false
  end
end

module ActiveSupport #:nodoc:
  class SafeBuffer < String
    def internationalization
      self
    end

    alias :i18n :internationalization
  end
end

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

  def internationalization
    translate_flag? ? translate(self, @options) : self
#   translate(self, @options)
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

class String
  # Marks a string as trusted safe. It will be inserted into HTML with no
  # additional escaping performed. It is your responsibilty to ensure that the
  # string contains no malicious content. This method is equivalent to the
  # `raw` helper in views. It is recommended that you use `sanitize` instead of
  # this method. It should never be called on user input.
  def html_safe
    ActiveSupport::SafeBuffer.new(self)
  end

  def internationalization
    TranslationBuffer.new(self).i18n
  end

  alias :i18n :internationalization

  def internationalization_options options = {}
    TranslationBuffer.new(self).io options
  end

  alias :io :internationalization_options

  def translate_false
    TranslationBuffer.new(self).translate_false
  end
end

module LocalizationBuffer
  def internationalization
    I18n.l self, (@options ||= {})
  end

  def translate_flag?
    !defined?(@translate_flag) || @translate_flag
  end

  alias :i18n :internationalization

  def internationalization_options options = {}
    @options = options
    self
  end

  alias :io :internationalization_options

  def translate_false
    @translate_flag = false
    self
  end
end

class Time
  include LocalizationBuffer
end

class DateTime 
  include LocalizationBuffer
end

class Date
  include LocalizationBuffer
end
