class Snipet < ActiveRecord::Base
  belongs_to :user
  has_many :stars
  has_many :users, :through => :stars
  validates :title, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { minimum: 2 }
end
