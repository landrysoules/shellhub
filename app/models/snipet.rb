class Snipet < ActiveRecord::Base
  belongs_to :user
  has_many :stars
  has_many :starring_users, :class_name => "User", :through => :stars
  validates :title, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { minimum: 2 }

  def toggle_star(user)
    star = stars.find_by_user_id(user.id)
    if star
      star.destroy
    else
      stars.create(:user_id => user.id)
    end
  end
end
