class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence:true
  validates :content, presence:true, length: { maximum: 140 }
<<<<<<< HEAD

  has_many :microposts
=======
>>>>>>> origin/master
  
end
