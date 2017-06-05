require 'rails_helper'

describe 'find_users_links' do
  it 'returns a users links' do

    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"facebook")
    link_two = user.links.create(url:"www.google.com", title:"google")

    user_links = Link.find_users_links(user)

    expect(user_links.count).to eq(2)
    expect(user_links.count).to_not eq(3)

    expect(user_links.first.url).to eq(link.url)
    expect(user_links.first.title).to eq(link.title)

    expect(user_links.first.url).to_not eq(link_two.url)
    expect(user_links.first.title).to_not eq(link_two.title)

    expect(user_links.last.url).to eq(link_two.url)
    expect(user_links.last.title).to eq(link_two.title)

    expect(user_links.last.url).to_not eq(link.url)
    expect(user_links.last.title).to_not eq(link.title)

  end
end
