class BooksController < ApplicationController
  def index
    @books = Book.all
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

  private

  def book_params
    params.require(:book).permit(:title, :author, :url)
  end
end
