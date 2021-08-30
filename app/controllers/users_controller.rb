class UsersController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_user, only: [:show]

  def index
    @users = current_user.users
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Administrador cadastrado com sucesso'
      render :show
    else
      render :new
    end
    # respond_to do |format|
    #   if @user.save
    #     format.html { render :show }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end
end
