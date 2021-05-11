class ReadersController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_reader, only: [:show]

  def index
    @readers = Reader.all
  end

  def new
    @reader = Reader.new
  end

  def show; end

  def create
    @reader = Reader.new(reader_params)
    if @reader.save
      flash[:success] = 'Leitor cadastrado com sucesso'
      render :show
    else
      render :new
    end
  end

  private

  def set_reader
    @reader = Reader.find(params[:id])
  end

  def reader_params
    params.require(:reader).permit(:id, :name, :phone, :email, :birth_date)
  end
end
