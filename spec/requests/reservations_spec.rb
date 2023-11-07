# rubocop:disable Metrics/BlockLength
require 'swagger_helper'
require 'rails_helper'

describe 'Reservations API' do
  path '/reservations' do
    get 'Retrieves a list of reservations' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'reservations found' do
        run_test!
      end
    end

    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          city_name: { type: :string },
          reservation_date: { type: :string, format: 'date' },
          package_name: { type: :string },
          package_type: { type: :string }
        },
        required: %w[city_name reservation_date package_name package_type]
      }

      response '201', 'reservation created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 city_name: { type: :string },
                 reservation_date: { type: :string, format: 'date' },
                 package_name: { type: :string },
                 package_type: { type: :string }
               }
        run_test!
      end

      response '422', 'invalid reservation data' do
        schema type: :object,
               properties: {
                 errors: { type: :array }
               }
        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true

    get 'Retrieves a reservation by ID' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'reservation found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 city_name: { type: :string },
                 reservation_date: { type: :string, format: 'date' },
                 package_name: { type: :string },
                 package_type: { type: :string }
               }
        run_test!
      end
    end

    delete 'Deletes a reservation' do
      tags 'Reservations'
      response '200', 'reservation deleted' do
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
