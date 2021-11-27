class User < ApplicationRecord

  has_secure_password

  # フォローする側からのhas_many
  has_many :favorites, foreign_key: :following_id
  has_many :followings, through: :favorites, source: :follower
  # foreign_key: :favoritingを入り口としてsource: :favoritedを出口としてフォローしているユーザーを取得
  # followingという仮想のテーブルでusersテーブルを区別している

  # フォローされる側からのhas_many
  has_many :reverse_of_favorites, class_name: 'Favorite', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_favorites, source: :following
  # foreign_key: :favoritedを入り口として、 source: :favoritingを出口としてフォローされているユーザーを取得
  # followerからはfavorited_idに複数フォローされているため、reverse_of_favoritesと記述している

  
  def is_followed_by?(user)
    reverse_of_favorites.find_by(following_id: user.id).present?
    # 引数に渡されたユーザーにフォローされているかどうかを判断する
  end

  validates :email, presence: true 
  validates :name, presence: true
  validates :heat, presence: true
  validates :location, presence: true
  validates :location_detail, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :self_introduction, presence: true

  enum heat: {
    プロ: 1,
    アマ: 2,
  }

  enum location: {
    北海道: 1,
    東北: 2,
    関東: 3,
    中部: 4,
    関西: 5,
    中国・四国: 6,
    九州: 7,
    沖縄: 8,
  }

  enum sex: {
    男性: 1,
    女性: 2,
    回答しない: 3,
  }

end
