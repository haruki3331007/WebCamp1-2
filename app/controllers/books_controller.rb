class BooksController < ApplicationController
  def index
    @newbook = Book.new
    @booklist = Book.all
  end

  def create
    @newbook = Book.new(newbook_params)
    if @newbook.save
      redirect_to book_path(@newbook.id)
      flash[:notice] = "Book was successfully created."
    else
      @booklist = Book.all
      render :index
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
    if @bookedit.update(bookedit_params)
      redirect_to book_path(@bookedit.id)
      flash[:notice] = "Book was successfully created."
    else
      render :edit
    end
  end


  def destroy
    @bookdelete = Book.find(params[:id])
    @bookdelete.delete
    redirect_to '/books/'
  end


  private
  def newbook_params
    params.require(:book).permit(:title, :body)
  end

  def bookedit_params
    params.require(:book).permit(:title, :body)
  end
end
