class Api::V1::LinksreadstatusController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: Link.find_users_links_by_read_status(current_user, params)
  end
end
