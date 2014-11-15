require 'rails_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'is valid' do
      instance = FactoryGirl.build(factory_name)
      expect(instance.valid?).to be_truthy, instance.errors.full_messages.to_sentence
    end
  end
end
