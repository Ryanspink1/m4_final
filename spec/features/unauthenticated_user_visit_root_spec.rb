require "rails_helper"

describe "unauthenticated user visiting the root path" do
  it "is redirected to a login/sign up page" do

    visit root_path

    expect(path).to eq('/login')
  end
end
