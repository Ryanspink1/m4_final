require 'rails_helper'

describe 'find_users_links_by_read_status' do
  it 'returns a users links with a true read status' do

    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"facebook", read:true)
    link_two = user.links.create(url:"www.google.com", title:"google", read:true)
    link_three = user.links.create(url:"www.espn.com", title:"espn", read:false)
    params = Hash.new
    params[:read] = true

    user_links = Link.find_users_links_by_read_status(user, params)

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

  it 'returns a users links with a true read status' do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"facebook", read:true)
    link_two = user.links.create(url:"www.google.com", title:"google", read:true)
    link_three = user.links.create(url:"www.espn.com", title:"espn", read:false)
    params = Hash.new
    params[:read] = false

    user_links = Link.find_users_links_by_read_status(user, params)

    expect(user_links.count).to eq(1)

    expect(user_links.first.url).to eq('www.espn.com')
    expect(user_links.first.url).to_not eq('www.facebook.com')

    expect(user_links.first.title).to eq('espn')
    expect(user_links.first.title).to_not eq('google')
  end
end
