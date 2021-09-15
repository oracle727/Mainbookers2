class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_params_id
  end

  def index
    # @user = name
  end

  def show
    @profile_image_id = @user.profile_image_id.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end



   private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
