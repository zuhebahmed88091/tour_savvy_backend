require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'packages', type: :request do
  path '/packages' do
    get('list packages') do
      tags 'Packages'
      produces 'application/json'
      response(200, 'successful') do
        schema(type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string },
                   image: { type: :string },
                   package_type: {
                     type: :array,
                     items: {
                       properties: {
                         name: { type: :string },
                         price: { type: :integer },
                         description: { type: :string }
                       }
                     }
                   },
                   user_id: { type: :integer },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
               })
        run_test!
      end
    end
  end
  path '/packages' do
    post('create package') do
      tags 'Packages'
      consumes 'application/json'
      parameter name: :package, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          image: { type: :string },
          package_type: {
            type: :array,
            items: {
              properties: {
                name: { type: :string },
                price: { type: :integer },
                description: { type: :string }
              }
            }
          }
        },
        required: %w[name description image package_type]
      }
      response(201, 'successful') do
        let(:package) { { name: 'Package 1', description: 'Package description', image: 'https://example.com/image.jpg', package_type: [{ name: 'Golden', price: 1000, description: '3 day 4 nights' }, { name: 'Silver', price: 500, description: '2 day 3 nights' }, { name: 'Platinum', price: 2000, description: '7 days 7 nights' }] } }
        run_test!
      end
    end
  end
  path '/packages/{id}' do
    get('a single package') do
      tags 'Packages'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      response(200, 'successful') do
        schema(type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 image: { type: :string },
                 package_type: {
                   type: :array,
                   items: {
                     properties: {
                       name: { type: :string },
                       price: { type: :integer },
                       description: { type: :string }
                     }
                   }
                 },
                 user_id: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               })
        run_test!
      end
    end
  end
  path '/packages/{id}' do
    delete('delete package') do
      tags 'Packages'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      response(200, 'successful') do
        schema(type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 image: { type: :string },
                 package_type: {
                   type: :array,
                   items: {
                     properties: {
                       name: { type: :string },
                       price: { type: :integer },
                       description: { type: :string }
                     }
                   }
                 },
                 user_id: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               })
        run_test!
      end
    end
  end
end
