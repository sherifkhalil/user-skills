require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    it { should rescue_from(ActiveRecord::RecordNotFound) }
    it { should rescue_from(ActiveRecord::RecordInvalid) }
end