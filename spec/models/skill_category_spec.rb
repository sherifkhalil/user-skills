require 'rails_helper'

RSpec.describe SkillCategory, type: :model do

  context 'Validations' do
    subject { create(:skill_category) }
    it { should validate_uniqueness_of(:category_id).scoped_to(:skill_id).with_message('has already been added to this skill') }
  end
  
  context 'Relations' do
    it { should belong_to(:skill) }
    it { should belong_to(:category) }
  end

end
