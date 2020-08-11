class PostsController < ApplicationController
  def index
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        render 'index'
    else
        render 'new'
    end
  end

 private
    def user_params
      params.require(:user).permit(:name, :email, :encrypted_password, :birthday, :family_name, :first_name, :family_name_kana, :first_name_kana)
    end
end
