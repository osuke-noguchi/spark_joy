class Admins::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
      @users = User.all.page(params[:page])



    if params[:search]
       @users = User.where('name LIKE ? OR age LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).reverse_order
    else
      User.all
    end
  end

  def show
    if @user[gender: 1] == 1
      puts "女性"
    else
      puts "男性"
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
