user = User.create(username: "zuheb")
# Create a package
user = User.create(username: "zuheb")
package = Package.create(name: "Mizoram", description: "Mizoram waterfall", image: "https://plus.unsplash.com/premium_photo-1675827055694-010aef2cf08f?auto=format&fit=crop&q=80&w=1424&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", package_type: [{ "name": "Golden","description": "3 day 4 nights", "price": 1000 }, { "name": "Silver","description": "2 day 3 nights", "price": 500 }, { "name": "Platinum","description": "7 days 7 nights", "price": 2000 }], user_id: user.id)
reservation = Reservation.create(reservation_date: "2021-10-28", city_name: "Mizoram", package_name: "Mizoram" , package_type: "Golden", user_id: user.id)
package.reservations << reservation