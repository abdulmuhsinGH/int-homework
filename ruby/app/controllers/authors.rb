# frozen_string_literal: true

class Homework::API::Authors < Grape::API
  version 'v1', using: :path
  resource :authors do
    helpers Homework::Helpers::ParamsHelper

    params do
      use :author
    end
    post do
      # TODO: Handle duplicate emails error 
      # TODO: and send a response that author with that email already exists
      present Author.create(declared(params)[:author])
    end

    get do
      present Author.all
    end

    params do
      requires :author_id, type: Integer, desc: 'Author ID.'
    end
    route_param :author_id do
      helpers do
        def current_author
          Author.find(declared(params)[:author_id])
        end
      end
      # TODO: use DELETE Method instead of GET for a delete action
      get :delete do
        present current_author.destroy
      end

      params do
        use :author
      end
      put do
        present current_author.update(declared(params)[:author])
      end
    end 
  end
end
