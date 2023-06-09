class UsersController < ApplicationController
  
  before_action:set_user, only: [:show, :edit, :update, :destroy]
  before_action:logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action:correct_user, only: [:edit, :update]
  before_action:admin_user, only: :destroy
  
  
  def show
    @user= User.find(params[:id])
  end
  
  def index
    @users= User.paginate(page: params[:page])
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
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to user_url
    else
      flash[:danger] = "ユーザー情報の更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success]= "#{@user.name}のデータを削除しました"
    redirect_to users_url
  end
  
  
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :department, 
                    :employee_number, :cardID, :password, :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger]= "ログインしてください"
        redirect_to login_url
      end
    end
    
    def correct_user
      @user= User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
    
  
end