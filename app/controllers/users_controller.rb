class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Pomyślnie utworzono nowe konto"
      redirect_to products_path
    else
      flash.now[:danger] = "Nie udało się pomyślnie utworzyć konta. Sprawdź czy wprowadzone dane są poprawne."
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
