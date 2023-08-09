# frozen_string_literal: true

class Homework::API::Articles < Grape::API
  version 'v1', using: :path
  resource :articles do
    helpers Homework::Helpers::ParamsHelper

    params do
      use :article
    end
    post do
      present Article.create(declared(params)[:article])
    end

    get do
      present Article.all
    end

    params do
      requires :article_id, type: Integer, desc: 'Article ID.'
    end
    route_param :article_id do
      helpers do
        def current_article
          Article.find(declared(params)[:article_id])
        end
      end

      get :delete do
        present current_article.destroy
      end

      params do
        use :article
      end
      put do
        present current_article.update(declared(params)[:article])
      end

      get :authors do
        present current_article.authors
      end

      params do
        use :author
      end
      post :authors do
        author = Author.create(declared(params)[:author])
       
        current_article.authors << author
        current_article.save

        present author
      end

      mount Homework::API::Authors
    end
  end
end
