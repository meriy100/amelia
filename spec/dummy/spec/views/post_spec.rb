require 'spec_helper'
require 'rails_helper'

describe 'post/index.html.erb' do
  before do
    render
  end

  it "は、タイトルを表示すること" do
    expect(rendered).to match "hello: Hello World"
  end
  it "translate_false で hello" do
    expect(rendered).to match "translate_false: hello"
  end
  it "html_safe では 自動置き換えしない" do
    expect(rendered).to match "html_safe: hello"
  end
  it "count チェック 1 の時" do
    expect(rendered).to match "Apple counter1: an apple"
  end
  it "count チェック 2 の時" do
    expect(rendered).to match "Apple counter2: 2 apples"
  end
  it "DateTime: format long" do
    expect(rendered).to match "DateTime: January 01, 2015 01:01"
  end
  it "Date:" do
    expect(rendered).to match "Date: 2012-05-15"
  end
  it "Time: format short" do
    expect(rendered).to match "Time: 31 Dec 23:59"
  end
end

