class Task < ApplicationRecord
  belongs_to :user

  #campos que nunca devem ser null
  validates_presence_of :title, :user_id
end
