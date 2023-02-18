require 'swagger_helper'
RSpec.describe 'api/v1/posts', type: :request do
  path '/api/v1/users/{user_id}/posts/?access_token={access_token}' do
    post 'Creates a post' do
      tags 'post'
      consumes 'application/json', 'application/xml'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :text }
        },
        required: %w[title text]
      }

      response '201', 'post created' do
        let(:post) { { title: 'Intro to rails', text: 'hello rails' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:post) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts/{id}?access_token={access_token}' do
    get 'Retrieves a post' do
      tags 'post'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :text }
               },
               required: %w[id title text]

        let(:id) { Post.create(title: 'System testing', text: 'Hello RSpec').id }
        run_test!
      end
      response '404', 'pet not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
