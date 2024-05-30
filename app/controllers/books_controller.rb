class BooksController < ApplicationController
  def new
    @bookers = Book.new
  end

  def create
    @bookers = Book.new(booker_params)
    if @bookers.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@bookers.id)
    else
     render :new
    end
  end

  def index
    @bookers = Book.all
    @booker = Book.new
  end

  def show
    @booker = Book.find(params[:id])
  end

  def edit
    @booker = Book.find(params[:id])
  end

  def update
     @booker = Book.find(params[:id])
     if @booker.update(booker_params)
      redirect_to book_path(@booker.id)
      flash[:notice] = "Book was successfully updated."
     else
      flash.now[:notice] =  "Book was not successfully updated."
      # @booker = Book.find(params[:id]
       render :edit
     end
  end

  def destroy
    booker = Book.find(params[:id])
    booker.destroy
    redirect_to "/books"
  end

  private
  def booker_params
    params.require(:book).permit(:title, :body, )
  end
end
