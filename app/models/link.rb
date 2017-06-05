class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true
  validates :url, :title, presence: true
  # validates :url, presence:true
  # validates :title, presence:true
    # validates :url, presence: true, uniqueness: true

  def self.find_users_links(params)
    where(user:params[:id])
  end

  def self.find_users_links_by_read_status(params)
    where(user:params[:id], read:params[:read])
  end
end
