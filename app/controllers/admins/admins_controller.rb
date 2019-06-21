class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
      @users = User.all
      @man = User.where(gender: 2).count
      @woman = User.where(gender: 1).count
      @gender_ratio = {"男性" => User.where(gender: 2).count, "女性" => User.where(gender: 1).count}
      @woman_age_average = User.where(gender: 1).average(:age).floor(1)
      @man_age_average = User.where(gender: 2).average(:age).floor(1)
      @uer_new = User.where("DATE(created_at) = '#{Date.today}'").count

   end

   def show
      @user = User.find(params[:id])
   end

end

