require 'rails_helper'

RSpec.describe Skill, type: :model do
  
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
  
  context 'Associations' do
    it { should have_many(:skill_categories) }
    it { should have_many(:categories).through(:skill_categories) }
  end
end
