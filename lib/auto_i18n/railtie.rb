require 'auto_i18n'

module AutoI18n
  class Railtie < ::Rails::Railtie
    initializer "auto_i18n.configure_view_controller" do |app|
      ActiveSupport.on_load :action_view do
        require 'auto_i18n/view_helpers/action_view'
        include AutoI18n::ViewHelpers::ActionView
      end
    end
  end
end
