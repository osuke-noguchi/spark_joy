class Admins::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all.page(params[:page]).reverse_order
  end

  def show

  end

  def edit
  end

  def update

  end

  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
