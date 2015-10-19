require "rails_helper"

describe AutoI18n do
  let(:str){ String.new("string"){include AutoI18n} }
  it 'Squawk' do
    expect(str.to_squawk).to eql "squawk! #{str}"
  end
end

