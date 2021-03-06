require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  context 'Associations' do
    it { should have_many(:user_skills) }
    it { should have_many(:skills).through(:user_skills) }
  end
end
