class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :snipet
end
