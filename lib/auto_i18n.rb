require 'auto_i18n/view_helpers/action_view'
require 'auto_i18n/core_ext'
require 'auto_i18n/output_safety'
require 'auto_i18n/action_view/helpers/asset_tag_helper'
require 'auto_i18n/action_view/helpers/tag_helper'

module AutoI18n

end

if defined?(::Rails::Railtie)
  require 'auto_i18n/railtie'
end


