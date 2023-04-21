class UsersController < ApplicationController
  
  
  def show
    @user= User.find(params[:id])
  end
  
  def index
    @users= User.all
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]= "ユーザーが作成されました"
      redirect_to @user
    else
      render:new
    end
  end
  
  
  
    private
    
    def user_params
      params.require(:user).permit(:name, :department,
                    :employee_number, :cardID, :password, :password_confirmation)
    end
  
end
