class User < ApplicationRecord
    validates_presence_of :name, :email

    validates :email, uniqueness: true

    has_many :user_skills
    has_many :skills, through: :user_skills
end
