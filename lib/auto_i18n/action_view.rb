require 'active_support'
require 'active_support/rails'
require 'action_view/version'
module ActionView
  extend ActiveSupport::Autoload
  
# autoload :Helpers, "action_view/helpers"

  require 'active_support/core_ext/string/output_safety'
end
