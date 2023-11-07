# rubocop:disable Metrics/BlockLength
require 'rails_helper'
require 'swagger_helper'

describe 'Packages API' do
  before(:each) do
    @admin_token = create_env_admin
    @non_admin_token = create_env
  end

  path '/packages' do
    get 'Retrieves a list of packages' do
      tags 'Packages'
      produces 'application/json'

      response '200', 'Packages found' do
        run_test!
      end
    end

    post 'Creates a package' do
      tags 'Packages'
      consumes 'application/json'
      parameter name: :package, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          image: { type: :string },
          package_type: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string },
              price: { type: :number }
            },
            required: %w[name description price]
          }
        },
        required: %w[name description image package_type]
      }

      response '201', 'Package created' do
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
        run_test! do
          expect(response).to have_http_status(:created)
        end
      end

      response '422', 'Invalid package data' do
        schema type: :object,
               properties: {
                 errors: { type: :array }
               }
        run_test!
      end
    end
  end

  path '/packages/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true

    get 'Retrieves a package by ID' do
      tags 'Packages'
      produces 'application/json'

      response '200', 'Package found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 image: { type: :string },
                 package_type: {
                   type: :object,
                   properties: {
                     name: { type: :string },
                     description: { type: :string },
                     price: { type: :number }
                   }
                 }
               }
        run_test!
      end
    end

    put 'Updates a package' do
      tags 'Packages'
      consumes 'application/json'
      parameter name: :package, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          image: { type: :string },
          package_type: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string },
              price: { type: :number }
            },
            required: %w[name description price]
          }
        },
        required: %w[name description image package_type]
      }

      response '200', 'Package updated' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 image: { type: :string },
                 package_type: {
                   type: :object,
                   properties: {
                     name: { type: :string },
                     description: { type: :string },
                     price: { type: :number }
                   },
                   required: %w[name description price]
                 }
               }
        run_test!
      end
    end

    delete 'Deletes a package' do
      tags 'Packages'
      response '200', 'Package deleted' do
        run_test!
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

    post '/login', params: { user: { username: 'mesak', password: '123456' } }
    JSON.parse(response.body)['token']
  end

  def create_env_admin
    User.create(
      username: 'admin',
      email: 'admin@mail.com',
      password: '123456',
      user_token: Faker::Alphanumeric.alpha(number: 10),
      admin: true
    )

    post '/login', params: { user: { username: 'admin', password: '123456' } }
    JSON.parse(response.body)['token']
  end
end
# rubocop:enable Metrics/BlockLength
