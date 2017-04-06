class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

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
        format.html { render 'book/new' }
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      respond_to do |format|
        format.html { redirect_to book_path(@book) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'book/new' }
        format.js
      end
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :resume, :author)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
