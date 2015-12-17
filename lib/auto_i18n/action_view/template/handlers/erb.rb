require 'erubis'

module ActionView
  class Template
    module Handlers
      class Erubis < ::Erubis::Eruby
        def add_preamble(src)
          @newline_pending = 0
          src << "@output_buffer = output_buffer || ActionView::OutputBuffer.new;@output_buffer.virtual_path = @virtual_path;"
        end
      end
    end
  end
end
