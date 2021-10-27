class BooksController < ApplicationController
  before_action :find_book, only: [:edit, :update, :show, :destroy]

  def index
    @books = Book.all.order("created_at DESC")
  end

  def show
  end

  def new
    @book = Book.new
  end
  
  
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path, alert: 'Successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), alert: ' Successfully updated.' 
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @book.book_img = nil
    @book.save
    @book.destroy
    redirect_to root_path, notice: 'Successfully deleted'

  rescue ActiveRecord::InvalidForeignKey
    redirect_to root_path, alert: "Failed to delete"
  end 
  
  private
    def book_params
      params.require(:book).permit(:title, :description, :author, :published_at, :country, :book_img)
    end

    def find_book
      @book = Book.find(params[:id])  
    end
end
