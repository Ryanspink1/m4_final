require 'rails_helper'


describe 'link read status index endpoint' do
  it 'returns list of links based on read status true' do

    user = User.create(id: 1, email:"user@user.com", password:"password")
    user.links.create(url:"www.facebook.com", title:"facebook", read: true)
    user.links.create(url:"www.espn.com", title:"espn", read: true)
    user.links.create(url:"www.jabron.com", title:"jabron", read: true)
    user.links.create(url:"www.wookie.com", title:"wookie", read: false)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get '/api/v1/linksreadstatus'

    expect(response).to be_success

    true_links = JSON.parse(response.body)

    expect(true_links.include?("www.wookie.com")).to eq(false)
    expect(true_links.include?("www.facebook.com")).to eq(true)
    expect(true_links.include?("www.espn.com")).to eq(true)
    expect(true_links.include?("www.jabron.com")).to eq(true)

  end
end
