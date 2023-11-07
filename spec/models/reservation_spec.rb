require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it 'reservation date should be present' do
    package = Package.new(name: 'Mesak', description: 'mesak', image: 'mesak', package_type: 'mesak')
    expect(package).to_not be_valid
  end

  it 'city name should be present' do
    package = Package.new(name: 'Mesak', description: 'mesak', image: 'mesak', package_type: 'mesak')
    expect(package).to_not be_valid
  end

  it 'package name should be present' do
    package = Package.new(name: 'Mesak', description: 'mesak', image: 'mesak', package_type: 'mesak')
    expect(package).to_not be_valid
  end

  it 'package type should be present' do
    package = Package.new(name: 'Mesak', description: 'mesak', image: 'mesak', package_type: 'mesak')
    expect(package).to_not be_valid
  end
end
