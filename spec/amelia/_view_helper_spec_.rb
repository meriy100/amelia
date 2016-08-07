# spec/amelia/view_helpers
require 'rails_helper'

describe Amelia::ViewHelpers::ActionView do
  let(:test_class) { Struct.new(:amelia) { include Amelia::ViewHelpers::ActionView } }
  let(:amelia) { test_class.new }

  describe 'Greet' do
    let(:name) { 'Bob' }

    before(:all) do
      let(:greet) { Greet.new { include Amelia::ViewHelpers::ActionView } }
      @greet = Amelia::ViewHelpers::ActionView::Greet.new(:name)
    end

    describe '#message' do
      it 'メッセージを返す' do
        expect(greet.message).to eql "Hi #{:name} !"
      end
    end

  end

  describe 'new_method_from_gem' do
    it 'Hallo Worldを返す' do
      expect(amelia.new_method_from_gem).to eql 'Hello World!'
    end
  end

  describe 'link_to_status' do
    it 'spanタグを持つこと' do
      amelia.extend ActionView::Helpers::TagHelper
      expect(amelia.link_to_name).to eq '<span>My Gem</span>'
    end
  end

end
