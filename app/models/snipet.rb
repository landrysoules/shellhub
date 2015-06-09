class Snipet < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { minimum: 2 }
end
