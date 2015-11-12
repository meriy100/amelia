require 'auto_i18n/active_support/core_ext/localization_buffer'

class Object

  def internationalization
    self
  end
#
# alias :i18n :internationalization

  def translate_flag?
    true
  end
  def translate_false
    @translate_flag = false
    self
  end
end

class Numeric

  def translate_flag?
    false
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
