class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :snipets
  has_many :stars
  has_many :starred_snipets, :through => :stars, :source => :snipet
  validates_presence_of :username
end
