require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/hash/keys'
require 'action_view/helpers/asset_url_helper'
require 'action_view/helpers/tag_helper'

module ActionView
  # = Action View Asset Tag Helpers
  module Helpers #:nodoc:
    # This module provides methods for generating HTML that links views to assets such
    # as images, JavaScripts, stylesheets, and feeds. These methods do not verify
    # the assets exist before linking to them:
    #
    #   image_tag("rails.png")
    #   # => <img alt="Rails" src="/assets/rails.png" />
    #   stylesheet_link_tag("application")
    #   # => <link href="/assets/application.css?body=1" media="screen" rel="stylesheet" />
    module AssetTagHelper
      extend ActiveSupport::Concern

      include AssetUrlHelper
      include TagHelper

      def javascript_include_tag(*sources)
        options = sources.extract_options!.stringify_keys
        path_options = options.extract!('protocol', 'extname').symbolize_keys
        sources.uniq.map { |source|
          tag_options = {
            "src" => path_to_javascript(source, path_options)
          }.merge!(options)
          content_tag(:script, "", tag_options, true, false)
        }.join("\n").html_safe
      end
    end
  end
end

