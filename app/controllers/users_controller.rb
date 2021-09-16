class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

   def create
    @user= User.new(user_params)
    @user.save
    redirect_to user_params_id
   end

  def edit
      @user = User.find(params[:id])
      @user.save
      if @user != current_user
        redirect_to user_path(current_user)

      end
  end

  def update
      @user= User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path (@user)
  end


   private
    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
    end
end
