require 'rails_helper'

RSpec.describe Recipe do
  it { should validate_presence_of(:prep_time) }
  it { should validate_length_of(:prep_time).is_at_most(5).with_message('should be no longer than 5 characters, e.g. 10m') }

  it { should validate_presence_of(:cooking_time) }
  it { should validate_length_of(:cooking_time).is_at_most(5).with_message('should be no longer than 5 characters, e.g. 10m') }

  it { should validate_presence_of(:serves) }
  it { should validate_numericality_of(:serves).is_less_than_or_equal_to(200).with_message("We're not Jesus, recipes should serve fewer than 200 people") }
end
