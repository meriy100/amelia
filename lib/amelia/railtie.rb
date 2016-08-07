require 'amelia'

module Amelia
  class Railtie < ::Rails::Railtie
    initializer "amelia.configure_view_controller" do |app|
      ActiveSupport.on_load :action_view do
        require 'amelia/view_helpers/action_view'
        include Amelia::ViewHelpers::ActionView
      end
    end
  end
end
