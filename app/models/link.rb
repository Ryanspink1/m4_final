class Link < ActiveRecord::Base
  belongs_to :user

  def self.find_users_links(params)
    where(user:params[:id])
  end
end
