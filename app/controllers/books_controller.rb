class BooksController < ApplicationController

  def mybooks
    @books = Book.all.current_user.book
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect to root_path
    else
      render 'new'
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :description, :author,:publisher).merge(user_id: current_user.id)
  end

end
