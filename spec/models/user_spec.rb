require "rails_helper"

RSpec.describe User, type: :model do
  it "成人かどうかが分かること" do
    user = User.new(name: "enta", age: 18)
    expect(user.adult?).to eq true
  end
end