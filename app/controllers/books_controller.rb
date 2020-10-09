class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :move_to_mybooks, except: [:mybooks, :show, :search]
  before_action :move_to_book, only: [:edit]

  def mybooks
    @books = Book.includes(:user)
  end
  
  def index
    if user_signed_in?
      @books = current_user.books
    else
      @books = Book.includes(:user)
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    # binding.pry
    # @comment = Comment.find(params[:comment_id])
    # @review = Review.find(params[:id])
    # @comments = @review.comments.includes(:review)
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author, :publisher, :image).merge(user_id: current_user.id)
  end

  def find_book
    @book = Book.find(params[:id])
  end
  
  def move_to_mybooks
    redirect_to action: :mybooks unless user_signed_in?
  end
  
  def move_to_book
    @book = Book.find(params[:id])
    redirect_to book_path(@book) if @book.user_id != current_user.id
  end


end
