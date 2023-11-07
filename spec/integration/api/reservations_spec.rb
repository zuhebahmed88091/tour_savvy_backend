require 'swagger_helper'
RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    get('list reservations') do
      tags 'Reservations'
      produces 'application/json'
      response(200, 'successful') do
        schema(type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   city_name: { type: :string },
                   reservation_date: { type: :string },
                   package_name: { type: :string },
                   package_type: { type: :string },
                   user_id: { type: :integer },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
               })
        run_test!
      end
    end
  end
  path '/reservations' do
    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          city_name: { type: :string },
          reservation_date: { type: :string },
          package_name: { type: :string },
          package_type: { type: :string }
        },
        required: %w[city_name reservation_date package_name package_type]
      }
      response(201, 'successful') do
        let(:reservation) do
          { city_name: 'Mizoram', reservation_date: '2021-10-28', package_name: 'Mizoram', package_type: 'Golden' }
        end
        run_test!
      end
    end
  end
  path '/reservations/{id}' do
    get('show reservation') do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      response(200, 'successful') do
        schema(type: :object,
               properties: {
                 id: { type: :integer },
                 city_name: { type: :string },
                 reservation_date: { type: :string },
                 package_name: { type: :string },
                 package_type: { type: :string },
                 user_id: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               })
        run_test!
      end
      response(404, 'invalid request') do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
  path '/reservations/{id}' do
    delete('delete reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      response(200, 'successful') do
        schema(type: :object,
               properties: {
                 id: { type: :integer },
                 city_name: { type: :string },
                 reservation_date: { type: :string },
                 package_name: { type: :string },
                 package_type: { type: :string },
                 user_id: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               })
        run_test!
      end
      response(404, 'invalid request') do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
