class User < ApplicationRecord
    validates_presence_of :name, :email

    validates :email, uniqueness: true

    has_many :user_skills
    has_many :skills, through: :user_skills

    # def self.all_users_with_skills_and_cats
        #eager_load instead of the common 'includes' to hit the DB once
        # eager_load(skills: :categories)


        # for distinct categories (not repeted due to its many to many rel. with skills)
        # joins(skills: :categories).
        # select('users.*, group_concat(skills.name) skills_names, group_concat(categories.name) categories_names').
        # group('users.id')
    # end

    # def self.user_with_skills_and_cats id
    #     all_users_with_skills_and_cats.find(id)
    # end

    # to deliver skills and categories with the json response
    def as_json(options={})
        super(include: { 
                skills: { 
                    include:  {
                        categories: { only: :name }
                    }, 
                    only: :name 
                } 
        })
    end

end
