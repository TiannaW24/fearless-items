require 'rails_helper'

# RSpec unit tests for test Items model

RSpec.describe Item, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:name) }
    end
end