require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET #index' do
        
        before { get :index }

        it { should respond_with(:ok) }
    end

    describe 'GET #show' do
        
        before { get :show, id: create(:user).id }

        it { should respond_with(:ok) }
    end

end
