module LocalizationBuffer
  def internationalization virtual_path = nil
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

  def format arg
    if @options.blank?
      @options = {format: arg}
    else
      @options[:format] = arg
    end
    self
  end

  def translate_false
    @translate_flag = false
    self
  end
end

