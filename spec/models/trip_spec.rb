require 'spec_helper'

describe Trip do
  it { should validate_presence_of(:official_number) }

  it { should belong_to(:match) }
end
