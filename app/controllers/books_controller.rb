class BooksController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit; end

  def show; end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Livro cadastrado com sucesso'
      render :show
    else
      render :new
    end
  end

  def update
    if @book.update!(book_params)
      flash[:success] = 'Livro atualizado com sucesso'
      render :show
    else
      render :edit
    end
  end

  def destroy
    if @book.can_delete?
      @book.delete
      flash[:success] = 'Livro deletado com sucesso'
      redirect_to books_path
    else
      flash.now[:danger] = 'Este livro possui empréstimos associados'
      render :show
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:id, :name, :author, :description, :publishing_company, :edition, :isbn,
                                 :status, :pages_number, :edition_year, :exemplary)
  end
end
