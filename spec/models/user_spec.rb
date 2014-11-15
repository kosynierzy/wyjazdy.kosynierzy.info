require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_confirmation_of(:password) }

  it { is_expected.to have_and_belong_to_many(:groups) }
  it { is_expected.to have_and_belong_to_many(:trips) }
end
