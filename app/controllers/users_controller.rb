class UsersController < ApplicationController

  before_action :set_follow, only: [:followings, :followers]

  def index
    @users = User.where.not(id: current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    # user_paramsはPOSTデータをチェックするメソッド 
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "ユーザー「#{@user.name}」を登録しました"
    else
      flash.now[:alert] = "未記入の欄がをあります"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました'
        render :edit
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました'
        render :edit
      end

    else
      redirect_to root_path
    end
  end


  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def search
    @users = User.where(heat: params[:heat_keyword], location: params[:location_keyword])
      if @users.count != 0
        render :index
      else
        @users = User.where(heat: params[:heat_keyword]).or(User.where(location: params[:location_keyword]))
        render :index
      end
  end

  #退会機能実装時に使用
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.update(delete_flg: true)
  #   # delte_flgをtrueにする⇨論理削除する
  #   reset_session
  #   flash[:notice] = 'ありがとうございました。頑張ってください'
  #   redirect_to root_path
  # end

  private

  def set_follow
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :heat, :location, :location_detail, :sex, :age, :hobby, :special_skill, :office, :history_art, :self_introduction, :delete_flg)
  end
end
