class Api::V1::LinksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def index
    render json: Link.find_users_links(params)
  end

  def create
    user = User.find(link_params[:user])
    user.links.create(url:link_params[:url], title:link_params[:title])
  end

private

  def link_params
    params.permit(:url,
                  :title,
                  :user,
                  :read,
                  :id)
  end
end
