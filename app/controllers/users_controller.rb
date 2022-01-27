class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.profile_picture.attach(io: File.open("#{Rails.root}/app/assets/images/default_image.jpg"), filename: "default_image.jpg")
    if @user.save
      log_in @user
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.profile_picture.attached?
      @user.profile_picture.purge
    end

    @user.profile_picture.attach(user_params[:profile_picture])
    
    if @user.profile_picture.attached?
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end
  
  def pp_params
    params.require(:user).permit(:profile_picture)
  end
end
