class Skill < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :skill_categories
    has_many :categories, through: :skill_categories
end
