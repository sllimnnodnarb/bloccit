class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  default_scope { order('created_at DESC') }
end
