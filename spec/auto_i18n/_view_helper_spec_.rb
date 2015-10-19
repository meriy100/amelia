# spec/auto_i18n/view_helpers
require 'rails_helper'

describe AutoI18n::ViewHelpers::ActionView do
  let(:test_class) { Struct.new(:auto_i18n) { include AutoI18n::ViewHelpers::ActionView } }
  let(:auto_i18n) { test_class.new }

  describe 'Greet' do
    let(:name) { 'Bob' }

    before(:all) do
      let(:greet) { Greet.new { include AutoI18n::ViewHelpers::ActionView } }
      @greet = AutoI18n::ViewHelpers::ActionView::Greet.new(:name)
    end

    describe '#message' do
      it 'メッセージを返す' do
        expect(greet.message).to eql "Hi #{:name} !"
      end
    end

  end

  describe 'new_method_from_gem' do
    it 'Hallo Worldを返す' do
      expect(auto_i18n.new_method_from_gem).to eql 'Hello World!'
    end
  end

  describe 'link_to_status' do
    it 'spanタグを持つこと' do
      auto_i18n.extend ActionView::Helpers::TagHelper
      expect(auto_i18n.link_to_name).to eq '<span>My Gem</span>'
    end
  end

end
