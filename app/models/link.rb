class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true
  validates :url, :title, presence: true

  def self.find_users_links(current_user)
    where(user: current_user.id)
  end

  def self.find_users_links_by_read_status(current_user, params)
    where(user:current_user.id, read:params[:read])
  end
end
