class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :edit, :destroy]

  def show
    @items = current_user.items
    @total_price = []
    @items.each do |item|
    @total_price << item.price
    @item_total_price = @total_price.sum
    end
   #カテゴリー別に金額を割り当てる
    @chart = []
    Item.group(:category).sum(:price).each do |item|
      p 'tets!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
      p item
      p item[0][:category_name]
      p item[1]
      @chart <<  [item[0][:category_name], item[1]]
    end
    p @chart
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: '会員情報を更新しました'
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
