require 'cgi'
require 'action_view/helpers/date_helper'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/form_tag_helper'
require 'action_view/helpers/active_model_helper'
require 'action_view/model_naming'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/hash/slice'
require 'active_support/core_ext/string/output_safety'
require 'active_support/core_ext/string/inflections'

module ActionView
  module Helpers
    class FormBuilder
      include ModelNaming
      def submit(value=nil, options={})
        value, options = nil, value if value.is_a?(Hash)
        value ||= submit_default_value
        @template.submit_tag(value.internationalization, options)
      end
    end
  end
end
