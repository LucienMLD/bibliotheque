class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      respond_to do |format|
        format.html { redirect_to book_path(@book) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'book/show' }
        format.js
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :resume, :author)
  end

  def set_user
    @book = Book.find(params[:id])
  end
end
