require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    user = User.new(email: 'user@email', password: 'abcd123')
    expect(user).to_not be_valid
  end

  it 'email should be present' do
    user = User.new(username: 'Mesak', password: 'abcd123')
    expect(user).to_not be_valid
  end

  it 'password should be present' do
    user = User.new(username: 'Mesak', email: 'mesak@email')
    expect(user).to_not be_valid
  end

  it 'name, email, password should be present' do
    user = User.new(username: 'Mesak', email: 'mesak@email', password: 'abcd123')
    expect(user).to be_valid
  end
end
