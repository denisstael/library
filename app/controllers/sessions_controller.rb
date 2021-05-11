class SessionsController < ApplicationController
  def new
    redirect_to books_path if user_signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to books_path
    else
      flash.now[:danger] = 'Email ou senha inválidos'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Logout com sucesso'
    redirect_to root_path
  end
end
