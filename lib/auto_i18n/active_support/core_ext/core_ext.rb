class Object

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
