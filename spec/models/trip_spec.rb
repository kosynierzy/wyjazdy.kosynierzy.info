require 'spec_helper'

describe Trip do
  it { should validate_presence_of(:official_number) }

  it { should belong_to(:match) }
  it { should validate_presence_of(:match) }

  it { should have_and_belong_to_many(:users) }
end
