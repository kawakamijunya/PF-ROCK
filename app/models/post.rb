class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags #中間テーブルであるpost_tagモデルを介してのtagモデルとの関連付けを記述
  validates :title, presence:true
  validates :caption, presence:true, length:{maximum:200}

  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
  
end
