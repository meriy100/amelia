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

