class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  validates :title, presence:true
  validates :caption, presence:true, length:{maximum:200}

  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
