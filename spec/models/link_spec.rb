
require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'relationships' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:title) }
  end

  it "should accept a valid url" do
    link_one = Link.new(url: 'https://www.jabron.com/',title: 'jabron')

    expect(link_one).to be_valid
  end

  it "should not accept an invalid url" do
    link_two = Link.new(url: 'google',title: 'google')

    expect(link_two).to_not be_valid
  end
end
