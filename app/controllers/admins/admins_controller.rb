class Admins::AdminsController < ApplicationController

  def index
    @users = User.all
    @man = User.where(gender: 2).count
    @woman = User.where(gender: 1).count
    @gender_ratio = {"男性" => User.where(gender: 2).count, "女性" => User.where(gender: 1).count}
    @mans_age = []

   end

   def show
      @user = User.find(params[:id])
   end
end

