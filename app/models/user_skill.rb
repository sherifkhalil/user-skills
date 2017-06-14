class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates_uniqueness_of :skill_id, scope: :user_id, message: 'has already been added to this user' 
end
