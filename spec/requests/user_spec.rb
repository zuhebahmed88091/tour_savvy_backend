require 'swagger_helper'
require 'rails_helper'

describe 'Login API' do
  let(:user) { User.create(username: 'zuheb', email: 'zuheb@email.com', password: '123456') }

  it 'authenticates a user and returns a token' do
    post :login, params: { user: { username: 'zuheb', password: '123456' } }

    expect(response).to have_http_status(:success)
    expect(response.body).to include('token')
  end
end

describe 'Users API' do
  path '/login' do
    post 'Logs in a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: %w[username password]
      }

      response '200', 'logged in successfully' do
        let(:user) { User.create(username: 'zuhebi', password: '123456', admin: true) }

        before do
          post '/login', params: { user: { username: 'zuhebi', password: '123456' } }
        end
        run_test!
      end

      response '422', 'invalid username' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/signup' do
    post 'Signs up a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[username email password]
      }

      response '201', 'user created' do
        schema type: :object,
               properties: {
                 user: { type: :object }
               }
        run_test!
      end

      response '422', 'invalid user details' do
        schema type: :object,
               properties: {
                 errors: { type: :array }
               }
        run_test!
      end
    end
  end
end
