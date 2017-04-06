class Advertisement < ActiveRecord::Base
  has_many :advertisements, dependent: :destroy
end
