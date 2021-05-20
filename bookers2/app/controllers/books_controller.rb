class BooksController < ApplicationController

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

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
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
