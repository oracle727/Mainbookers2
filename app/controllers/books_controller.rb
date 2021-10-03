class BooksController < ApplicationController


  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book)
    flash[:notice] = "You have created book successfully."
    else
    render:"index"
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @myuser = current_user
    @book_comment = BookComment.new
    @book_comments = BookComment.all
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
    if @user != @book.user
      redirect_to books_path
    end
  end

  def update
    @user =  current_user
    @book = Book.find(params[:id])
    flash[:notice] = "You have updated book successfully."
      if @book.update(book_params)
      redirect_to book_path (@book)
      else
      render:edit
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
      redirect_to books_path
    @user = current_user
    if @user != @book.user
      redirect_to books_path
    end
  end


  private
  def book_params
      params.require(:book).permit(:title, :body)
  end

end
