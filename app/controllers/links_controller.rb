class LinksController < ApplicationController
  require 'pry'
    before_action :user!

  def index
    @id = Presenter.find_current_user_id(current_user)
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    link = Link.find(params[:id])
    if link.update(url:params[:link][:url], title: params[:link][:title])
      flash[:success] = "You have successfully updated your link"
      redirect_to root_path
    else
      render :edit
      # flash[:danger] = link.errors.full_messages.to_sentence
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
