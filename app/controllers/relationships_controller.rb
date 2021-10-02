class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    # binding.pry
    follow = current_user.relationships.new(followers_id: params[:user_id])
    follow.save
    redirect_to request.referrer || root_path
  end

  def destroy
    follow = current_user.relationships.find_by(followers_id: params[:user_id])
    follow.destroy
    redirect_to request.referrer || root_path
  end
end
