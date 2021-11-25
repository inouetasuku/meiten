class FavoritesController < ApplicationController

  def index
    @users = current_user.followings && current_user.followers
  end

  def create
    following = current_user.favorites.build(follower_id: params[:user_id])
    # following_idにはcurrent_user,favorited_idにはparamsからとってきたuser_idが格納される
    following.save
    redirect_to request.referrer || root_path
    flash.notice = "フォローしました"
    # request.referrerは以前のpathに戻ることができる
    # || はNILLガード、以前のpathが見つからない可能性があるため
  end

  def destroy
    following = current_user.favorites.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || root_path
    flash.notice = "フォローを解除しました"
  end

end
