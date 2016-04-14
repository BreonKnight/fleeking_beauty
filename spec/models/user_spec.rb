require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user) { FactoryGirl.create(:user) }

  describe User do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:userName) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

end
