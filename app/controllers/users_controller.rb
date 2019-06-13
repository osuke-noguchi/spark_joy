class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :edit, :destroy]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
  end

  private
    def set_user
     @user = User.find(params[:id])
    end

    def user_params
       params.require(:user).permit(:name, :email, :age)
    end


end
