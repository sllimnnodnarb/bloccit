class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :advertisements, dependent: :destroy
end
