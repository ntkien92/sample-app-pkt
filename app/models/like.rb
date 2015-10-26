# Like
class Like < ActiveRecord::Base
  belongs_to :liker, class_name: 'User', foreign_key: 'user_id'
  belongs_to :liked, class_name: 'Micropost', foreign_key: 'micropost_id'
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
