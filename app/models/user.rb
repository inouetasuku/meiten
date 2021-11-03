class User < ApplicationRecord

  validates :email, presence: true
  validates :password, presence: true
   
  enum heat: {
    pro: 0,
    ama: 1,
  }

  enum location: {
    hokkaido: 0,
    touhoku: 1,
    kantou: 2,
    tyubu: 3,
    kansai: 4,
    tyusikoku: 5,
    kyusyu: 6,
    okinawa: 7,
  }

  enum sex: {
    man: 0,
    woman: 1,
    not_anser: 2,
  }

end
