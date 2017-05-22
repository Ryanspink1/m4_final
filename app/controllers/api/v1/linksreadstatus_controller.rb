class Api::V1::LinksreadstatusController < ApplicationController

def index
  render json: Link.find_users_links_by_read_status(params)
end



end
