Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    get "/users/" => "users#show"
    patch "/users/" => "users#update"
    delete "/users" => "users#destroy"

    post "/sessions" => "sessions#create"
    
    get "/recipes" => "recipes#index"
    post "/recipes" => "recipes#create"
    post "/recipes/scrape" => "recipes#scrape"
    get "/recipes/:id" => "recipes#show"
    patch "/recipes/:id" => "recipes#update"
    delete "/recipes/:id" => "recipes#destroy"

    get "/tags" => "tags#index"
    # post "/tags" => "tags#create"
    get "/tags/:id" => "tags#show"
    patch "/tags/:id" => "tags#update"
    delete "/tags/:id" => "tags#destroy"

    post "/recipe_tags" => "recipe_tags#create"
    delete "/recipe_tags" => "recipe_tags#destroy"

  end
end
