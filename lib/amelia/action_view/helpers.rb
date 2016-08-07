require 'active_support/benchmarkable'
require 'helpers/tag_helper'
require 'helpers/asset_tag_helper'

module ActionView #:nodoc:
  module Helpers #:nodoc:
    extend ActiveSupport::Autoload
#    autoload :TagHelper, "helpers/tag_helper"
#    autoload :AssetTagHelper, "helpers/asset_tag_helper"
    include TagHelper
  end
end

