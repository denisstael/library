class ReadersController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_reader, only: %i[show edit update destroy]

  def index
    @readers = Reader.all.order(:id)
  end

  def new
    @reader = Reader.new
  end

  def show; end

  def edit; end

  def create
    @reader = Reader.new(reader_params)
    if @reader.save
      flash[:success] = 'Leitor cadastrado com sucesso'
      redirect_to readers_path
    else
      render :new
    end
  end

  def update
    if @reader.update(reader_params)
      flash[:success] = 'Leitor atualizado com sucesso'
      redirect_to readers_path
    else
      render :new
    end
  end

  def destroy
    if @reader.can_delete?
      @reader.delete
      flash[:success] = 'Leitor deletado com sucesso'
      redirect_to readers_path
    else
      flash.now[:danger] = 'Este leitor possui empréstimos associados'
      render :show
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
