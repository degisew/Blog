require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments?access_token={access_token}' do
    post 'Creates a comment' do
      tags 'comment'
      consumes 'application/json', 'application/xml'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          author: { type: :string },
          text: { type: :text }
        },
        required: %w[author text]
      }

      response '201', 'comment created' do
        let(:comment) { { author: :user_id, text: 'Awesome article.' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { author: :user_id } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts/{post_id}/comments?access_token={access_token}' do
    get 'Retrieves a comment' do
      tags 'comment'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 author: { type: :string },
                 text: { type: :text }
               },
               required: %w[id author text]

        let(:id) { Comment.create(author: 'foo', text: 'bar').id }
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
