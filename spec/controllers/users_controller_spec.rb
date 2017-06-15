require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:user) { create(:user) }

    context 'GET #index' do
        
        before { get :index }

        it { should respond_with(:ok) }
    end

    context 'GET #show' do
        
        before { get :show, params: { id: user.id } }
        
        it { should respond_with(:ok) }
    end

end
