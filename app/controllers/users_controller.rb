class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    # user_paramsはPOSTデータをチェックするメソッド 
    if @user.save
      redirect_to users_url, notice: "ユーザー「#{@user.name}」を登録しました"
    else
      flash.now[:alert] = "未記入の欄がをあります"
      render :new
    end
  end

  def update
  end

  def destroy
  end



  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :heat, :location, :location_detail, :sex, :age, :hobby, :special_skill, :office, :history_art, :self_introduction, :delete_flg)
  end
end
