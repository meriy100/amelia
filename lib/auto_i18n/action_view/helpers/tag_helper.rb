require 'active_support/core_ext/string/output_safety'
require 'set'

module ActionView
  module Helpers #:nodoc:
    module TagHelper
      extend ActiveSupport::Concern
      include CaptureHelper
      include OutputSafetyHelper

      def content_tag(name, content_or_options_with_block = nil, options = nil, escape = true, translate = true , &block)
        if block_given?
          options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
          content_tag_string(name, capture(&block), options, escape)
        else
          content_tag_string(name, content_or_options_with_block, options, escape, translate)
        end
      end

      private

        def content_tag_string(name, content, options, escape = true, translate = true )
          tag_options = tag_options(options, escape) if options
          if translate
            i18n_scope_content = I18n.t(content)
            content = i18n_scope_content.match("translation missing") ? content : i18n_scope_content
          end
          content     = ERB::Util.unwrapped_html_escape(content) if escape
          "<#{name}#{tag_options}>#{PRE_CONTENT_STRINGS[name.to_sym]}#{content}</#{name}>".html_safe
        end
    end
  end
end
