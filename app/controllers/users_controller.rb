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
      log_in @user
      flash[:success]= "ユーザーが作成されました"
      redirect_to @user
    else
      render:new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = ""
      redirect_to user_url
    else
      flash[:danger] = ""
      render :edit
    end
  end
  
  def destroy
    log_out
    flash[:success]= "ログアウトしました"
    redirect_to root_url
  end
  
  
  
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :department, 
                    :employee_number, :cardID, :password, :password_confirmation)
    end
  
end
