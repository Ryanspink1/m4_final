class LinksController < ApplicationController
    before_action :user!
    skip_before_filter :verify_authenticity_token

  def index
    @id = current_user.id
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    link = Link.find(params[:id])
    if link.update(url:params[:link][:url], title: params[:link][:title], read:false)
      flash[:success] = "You have successfully updated your link"
      redirect_to root_path
    else
      flash[:danger] = link.errors.full_messages.to_sentence
      redirect_to edit_link_path
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
