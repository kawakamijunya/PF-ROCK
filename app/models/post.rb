class Post < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  
  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
end
