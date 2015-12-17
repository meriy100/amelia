require 'auto_i18n/view_helpers/action_view'
# require 'auto_i18n/output_safety'
require 'auto_i18n/active_support/core_ext/output_safety'
require 'auto_i18n/active_support/core_ext/string'
require 'auto_i18n/active_support/core_ext/core_ext'
require 'auto_i18n/active_support/core_ext/translation_buffer'
require 'auto_i18n/active_support/core_ext/localization_buffer'
require 'auto_i18n/action_view/helpers/asset_tag_helper'
require 'auto_i18n/action_view/helpers/tag_helper'
require 'auto_i18n/action_view/helpers/form_helper'
# require 'auto_i18n/action_view/helpers/capture_helper'
require 'auto_i18n/action_view/buffer'
require 'auto_i18n/action_view/template/handlers/erb.rb'
# require 'auto_i18n/action_view/template'

module AutoI18n
#  autoload :ActionView
end

if defined?(::Rails::Railtie)
  require 'auto_i18n/railtie'
end


