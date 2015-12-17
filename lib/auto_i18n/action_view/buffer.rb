require 'active_support/core_ext/string/output_safety'
module ActionView
  class OutputBuffer < ActiveSupport::SafeBuffer #:nodoc:
    def initialize(*)
      super
      encode!
    end

    def virtual_path= arg
      @virtual_path = arg
      self
    end

    def <<(value)
      return self if value.nil?
      super(value.internationalization.to_s)
    end
    alias :append= :<<

    def safe_expr_append=(val)
      return self if val.nil?
      safe_concat val.to_s
    end

    alias :safe_append= :safe_concat
  end
end
class String
  def to_squawk
    "squawk! #{self}".strip
  end
end
