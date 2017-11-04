class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Pomyślnie zalogowano jako #{user.name}"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Logowanie nie powiodło się. Sprawdź, czy wprowadzone dane są prawidłowe."
      render 'new'
    end
      
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Pomyślnie wylogowano z aplikacji"
    redirect_to root_path
  end
end
