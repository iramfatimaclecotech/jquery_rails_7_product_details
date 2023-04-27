class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def remove_all
    respond_to do |format|
     @books = Book.where(id: params[:book_ids])
      @books.delete_all
       format.js
     end
  end


  def destroy
    @book = params[:id].each do |id|
        Book.find(id.to_i).destroy
      end
    
  end

  private
    def book_params
      params.require(:book).permit(:writer, :publish_year)
    end
end
