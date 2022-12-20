class BooksController < ApplicationController
  def index
    @newbook = Book.new
    @booklist = Book.all
  end

  def create
    newbook = Book.new(newbook_params)
    newbook.save
  end

  def show
    @book_details = Book.find(params[:id])
  end

  private
  def newbook_params
    params.require(:book).permit(:title, :body)
  end

end
