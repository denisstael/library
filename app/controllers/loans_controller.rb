class LoansController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_loan, only: [:show]

  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
    @readers = Reader.all
    @books = Book.all
  end

  def show
    @reader = @loan.reader
    @book = @loan.book
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      flash[:success] = 'Empréstimo cadastrado com sucesso'
      render :show
    else
      render :new
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
