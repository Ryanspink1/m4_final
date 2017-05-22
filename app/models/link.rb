class Link < ActiveRecord::Base
  belongs_to :user
    # validates :url, presence: true, uniqueness: true

  def self.find_users_links(params)
    where(user:params[:id])
  end
end
