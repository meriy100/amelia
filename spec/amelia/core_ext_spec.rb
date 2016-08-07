require "rails_helper"

describe Amelia do
  let(:str){ String.new("string"){include Amelia} }
  it 'Squawk' do
    expect(str.to_squawk).to eql "squawk! #{str}"
  end
end

