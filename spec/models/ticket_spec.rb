require 'rails_helper'
RSpec.describe Ticket, type: :model do
  before(:all) do
    @ticket = create(:ticket)
  end

  it 'is valid with valid attributes' do
    expect(@ticket).to be_valid
  end
end
