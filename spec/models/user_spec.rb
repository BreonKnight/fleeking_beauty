require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { FactoryGirl.create(:user) }

  describe 'User Validations' do
    it { should validate_presence_of(:first_name) }
    # it { validates_presence_of(:last_name) }
    # it { validates_presence_of(:userName) }
    # it { validates_presence_of(:email) }
    # it { validates_presence_of(:password) }
  end

end
