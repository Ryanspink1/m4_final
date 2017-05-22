class LinksController < ApplicationController
    before_action :user!

  def index
    @id = Presenter.find_current_user_id(current_user)
  end

end
