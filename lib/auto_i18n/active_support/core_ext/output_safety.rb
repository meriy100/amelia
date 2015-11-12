require 'erb'
require 'active_support/core_ext/kernel/singleton_class'
require 'active_support/deprecation'

module ActiveSupport #:nodoc:
  class SafeBuffer < String
    def internationalization
      self
    end

    def safe_concat value
      value.internationalization
      raise SafeConcatError unless html_safe?
      original_concat value
    end

    alias :i18n :internationalization
  end
end

