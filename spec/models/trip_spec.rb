require 'spec_helper'

describe Trip do
  it { should validate_presence_of(:match_id) }
  it { should validate_presence_of(:official_number) }
end
