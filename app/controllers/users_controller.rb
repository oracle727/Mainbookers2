class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

  end
  
  def edit
  end


   private
    def _users
    params.require(:User).permit(:title, :body, :image)
    end
end
