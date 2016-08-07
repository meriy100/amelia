#amelia/view_helpers/action_view.rb

require 'action_view'

module Amelia
  module ViewHelpers
    module ActionView
         class Greet
          def initialize name
            @hello = "Hi #{name} !"
          end

          def message
            @hello
           end
        end

        def new_method_from_gem
             'Hello World!'
        end

        def link_to_name
          content_tag :span, "My Gem"
        end

    end
  end
end
