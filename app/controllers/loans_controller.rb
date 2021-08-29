class LoansController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_loan, only: %i[show edit update destroy]

  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
    @readers = Reader.all
    @books = Book.all
  end

  def edit
    @readers = [@loan.reader]
    @books = [@loan.book]
  end

  def show
    @reader = @loan.reader
    @book = @loan.book
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      flash[:success] = 'Empréstimo cadastrado com sucesso'
      redirect_to loans_path
    else
      render :new
    end
  end

  def update
    if @loan.update(loan_params)
      flash[:success] = 'Empréstimo atualizado com sucesso'
      redirect_to loans_path
    else
      render :new
    end
  end

  def destroy
    if @loan.delete
      flash[:success] = 'Empréstimo deletado com sucesso'
      redirect_to loans_path
    else
      render :show
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:loan_date, :devolution_date, :reader_id, :book_id)
  end
end
