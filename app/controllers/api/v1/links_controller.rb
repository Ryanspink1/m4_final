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
    render json: Link.find_users_links(current_user)
  end

  def create
    user = User.find(current_user.id)
    link = user.links.new(url:link_params[:url], title:link_params[:title])
    if link.save
      render json:link
    else
      render json: link.errors.full_messages, status: 500
    end
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
