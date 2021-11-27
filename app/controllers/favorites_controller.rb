class FavoritesController < ApplicationController

  def index
    @users = current_user.followings && current_user.followers
  end

  def create
    following = current_user.favorites.build(follower_id: params[:user_id])
    # following_idにはcurrent_user,favorited_idにはparamsからとってきたuser_idが格納される
    if following.save
      flash.notice = "フォローしました"
      redirect_to request.referrer || root_path
    else
      flash.alert = "フォローできませんでした"
      render root_path
    end
  end
      # request.referrerは以前のpathに戻ることができる
      # || はNILLガード、以前のpathが見つからない可能性があるため

  def destroy
    following = current_user.favorites.find_by(follower_id: params[:user_id])
    if following.destroy
      redirect_to request.referrer || root_path
      flash.notice = "フォローを解除しました"
    else
      render :show
    end
  end

end
