require 'amelia/view_helpers/action_view'
# require 'amelia/output_safety'
require 'amelia/active_support/core_ext/output_safety'
require 'amelia/active_support/core_ext/string'
require 'amelia/active_support/core_ext/core_ext'
require 'amelia/active_support/core_ext/translation_buffer'
require 'amelia/active_support/core_ext/localization_buffer'
require 'amelia/action_view/helpers/asset_tag_helper'
require 'amelia/action_view/helpers/tag_helper'
require 'amelia/action_view/helpers/form_helper'
require 'amelia/action_view/buffer'
require 'amelia/action_view/template/handlers/erb.rb'

module Amelia
#  autoload :ActionView
end

if defined?(::Rails::Railtie)
  require 'amelia/railtie'
end


