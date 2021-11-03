class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)# user_paramsはPOSTデータをチェックするメソッド
    @user.save!
    redirect_to users_url,notice:'ユーザー「#{user.name}」を登録しました'
  end

  def index
    @user = User.all
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:name, :heat, :location, :location_detail, :sex, :age, :hobby, :special_skill, :office, :history_art, :self_introduction)
  end
end
