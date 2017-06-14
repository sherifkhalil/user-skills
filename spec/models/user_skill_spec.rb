require 'rails_helper'

RSpec.describe UserSkill, type: :model do

  context 'Validations' do
    subject { create(:user_skill) }
    it { should validate_uniqueness_of(:skill_id).scoped_to(:user_id).with_message('has already been added to this user') }
  end
  
  context 'Relations' do
    it { should belong_to(:user) }
    it { should belong_to(:skill) }
  end

end