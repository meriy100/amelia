require 'erb'
require 'active_support/core_ext/kernel/singleton_class'
require 'active_support/deprecation'

module ActiveSupport #:nodoc:
  class SafeBuffer < String
    def internationalization
      self
    end

    alias :i18n :internationalization
  end
end


###########################################
#####LocalizationBuffer ###########
###########################################

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

