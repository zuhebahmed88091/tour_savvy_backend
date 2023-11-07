require 'rails_helper'
require 'swagger_helper'

describe 'Packages API' do
  before(:each) do
    @admin_token = create_env_admin
    @non_admin_token = create_env
  end

  describe 'POST /packages' do
    let(:package_data) do
      {
        name: 'Test Package',
        description: 'Test package description',
        image: 'test_image.png',
        package_type: {
          name: 'Type A',
          description: 'Type A description',
          price: 50.0
        }
      }
    end

    context 'as an admin' do
      it 'creates a package' do
        post '/packages', params: { package: package_data }, headers: { 'Authorization' => @admin_token }
        expect(response).to have_http_status(201)
        expect(Package.count).to eq(1)
        expect(Package.last.name).to eq(package_data[:name])
      end
    end

    context 'as a non-admin user' do
      it 'cannot create a package' do
        post '/packages', params: { package: package_data }, headers: { 'Authorization' => @non_admin_token }
        expect(response).to have_http_status(403)
        expect(Package.count).to eq(0)
      end
    end
  end

  def create_env
    User.create(
      username: 'mesak',
      email: 'mesak@mail.com',
      password: '123456',
      user_token: Faker::Alphanumeric.alpha(number: 10),
      admin: false
    )

    post '/login', params:
                      { user: {
                        username: 'mesak',
                        password: '123456'
                      } }
    @token = response.data['user_token']
  end

  def create_env_admin
    User.create(
      username: 'mesak',
      email: 'mesak@mail.com',
      password: '123456',
      user_token: Faker::Alphanumeric.alpha(number: 10),
      admin: true
    )
    post '/login', params:
                      { user: {
                        username: 'mesak',
                        password: '123456'
                      } }
    @token = response.data['user_token']
  end
end
