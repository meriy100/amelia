# spec/dummy/app/controller/post_controller.rb

class PostController < ApplicationController
  def index
     @auto_i18n = AutoI18n::ViewHelpers::ActionView::Greet.new 'Bob'
     @message = 'hello'
  end
end
