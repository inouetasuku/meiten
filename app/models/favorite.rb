class Favorite < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User'
  # following,floowerテーブルは実際には存在しない、なのでUserテーブルを参照して欲しいためclass_name: 'User'と記述
  # follow,followerは区別をするために記述したもの

  validates :following_id, presence: true
  validates :follower_id, presence: true
end
