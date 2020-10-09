class CommentsController < ApplicationController
  before_action :find_book
  before_action :find_review
  before_action :find_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end
  
  def create
    # binding.pry
    @comment = Comment.new(comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to book_path(@book)
  end

  private

  def comment_params
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:review_id])
    params.require(:comment).permit(:content, :like).merge(user_id: current_user.id, book_id: @book.id, review_id: @review.id)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_review
    @review = Review.find(params[:review_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
