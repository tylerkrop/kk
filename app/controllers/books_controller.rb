class BooksController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    @books = Book.order(:title).page params[:page]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created"
    else
      redirect_to new_book_path, alert: "Error: #{@book.errors.full_messages.join(", ")}"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated"
    else
      redirect_to book_path(@book), alert: "Error: #{@book.errors.full_messages.join(", ")}"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      raise "Failed to destroy book: #{@book.errors.full_messages.join(", ")}"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :url)
  end
end
