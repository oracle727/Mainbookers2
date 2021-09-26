class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
    @users = User.all


  end

  def create
    @user= User.new(user_params)
    @user.save
     redirect_to user_params_id
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user)
    end
  end

  def update
    @user= User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path (@user)
    else
    render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end


   private
    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
