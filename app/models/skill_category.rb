class SkillCategory < ApplicationRecord
  belongs_to :skill
  belongs_to :category

  validates_uniqueness_of :category_id, scope: :skill_id, message: 'has already been added to this skill' 
end
