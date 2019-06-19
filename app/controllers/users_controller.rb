class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :edit, :destroy]

  def show
    @items = @user.items
    @total_price = []
    @items.each do |item|
    @total_price << item.price
    @item_total_price = @total_price.sum
    end

   #カテゴリー別に金額を割り当てる
    @chart = []
    @items.group(:category).sum(:price).each do |item|
      p item
      @chart <<  [item[0][:category_name], item[1]]
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, flash[:notice] = '会員情報を更新しました'
    else
      render :edit
    end
  end


  def destroy
    @items = Item.find_by(user_id: params[:id])
    flash[:notice] = "ユーザーを削除しました！"
    if @items.nil?
      @user.destroy
      redirect_to("/")
    else
      @items.destroy
      @user.destroy
      redirect_to("/")
    end
  end

  private
    def set_user
     @user = User.find(params[:id])
    end

    def user_params
       params.require(:user).permit(:name, :email, :age)
    end
end
