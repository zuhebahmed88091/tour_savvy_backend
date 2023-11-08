require 'rails_helper'

RSpec.describe Package, type: :model do
  it 'name should be present' do
    reservation = Reservation.new(reservation_date: '2020-12-12', city_name: 'Bandung',
                                  package_name: 'Mesak', package_type: 'Mesak')
    expect(reservation).to_not be_valid
  end

  it 'description should be present' do
    reservation = Reservation.new(reservation_date: '2020-12-12', city_name: 'Bandung',
                                  package_name: 'Mesak', package_type: 'Mesak')
    expect(reservation).to_not be_valid
  end

  it 'image should be present' do
    reservation = Reservation.new(reservation_date: '2020-12-12', city_name: 'Bandung',
                                  package_name: 'Mesak', package_type: 'Mesak')
    expect(reservation).to_not be_valid
  end

  it 'package_type should be present' do
    reservation = Reservation.new(reservation_date: '2020-12-12', city_name: 'Bandung',
                                  package_name: 'Mesak', package_type: 'Mesak')
    expect(reservation).to_not be_valid
  end
end
