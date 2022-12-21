class BooksController < ApplicationController
  def index
    @newbook = Book.new
    @booklist = Book.all
  end

  def create
    newbook = Book.new(newbook_params)
    if newbook.save
      redirect_to book_path(newbook.id)
    end
  end

  def show
    @book_details = Book.find(params[:id])
  end

  def edit
    @bookedit = Book.find(params[:id])
  end

  def update
    @bookedit = Book.find(params[:id])
    @bookedit.update(bookedit_params)
    redirect_to book_path(@bookedit.id)
  end

  private
  def newbook_params
    params.require(:book).permit(:title, :body)
  end

  def bookedit_params
    params.require(:book).permit(:title, :body)
  end
end
