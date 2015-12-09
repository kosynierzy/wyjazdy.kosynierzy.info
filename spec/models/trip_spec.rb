require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { is_expected.to validate_presence_of(:official_number) }

  it { is_expected.to belong_to(:match) }
  it { is_expected.to validate_presence_of(:match) }
end
