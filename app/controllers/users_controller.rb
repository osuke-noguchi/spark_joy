class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :edit, :destroy]
  before_action :ensure_correct_user
  before_action :authenticate_user!

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
      @chart <<  [item[0][:category_name], item[1]]
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = '会員情報を更新しました'
      redirect_to user_path
    else
      render :edit
    end
  end


  def destroy
    @items = Item.find_by(user_id: params[:id])
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

    def ensure_correct_user
    if current_user.id != params[:id].to_i
       redirect_to root_path
    end
  end
end
