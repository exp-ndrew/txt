require 'rails_helper'

describe Contact do
  it { should have_and_belong_to_many :messages }
end
