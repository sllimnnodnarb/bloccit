class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :advertisements, dependent: :destroy


  default_scope { order('created_at DESC') }

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
end
