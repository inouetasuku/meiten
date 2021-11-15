class User < ApplicationRecord

  has_secure_password


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
