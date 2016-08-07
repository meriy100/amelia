# spec/dummy/app/controller/post_controller.rb

class PostController < ApplicationController
  def index
     @auto_i18n = Amelia::ViewHelpers::ActionView::Greet.new 'Bob'
     @message = 'hello'
  end

  def jsrender
    respond_to do |format|
      format.html
      format.js
    end
  end

  def helper_tag

  end

end
