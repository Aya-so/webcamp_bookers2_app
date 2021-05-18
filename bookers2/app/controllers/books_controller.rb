class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@books = Book.all
  	if @book.save
  	   flash[:notice] = "You have creatad book successfully."
  	   redirect_to book_path(@book.id)
  	else
  	   render :index
  	end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    @book.destroy
  	redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
