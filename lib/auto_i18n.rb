require 'auto_i18n/view_helpers/action_view'
require 'auto_i18n/core_ext'
require 'auto_i18n/output_safety'

module AutoI18n

end

if defined?(::Rails::Railtie)
  require 'auto_i18n/railtie'
end


