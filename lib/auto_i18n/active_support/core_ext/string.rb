class String
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
