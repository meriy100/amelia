Rails.application.routes.draw do
  scope "(/:locale)", locale: /en|ja/ do

    get "/post", to: "post#index", as: "post"
    get "/post/helper_tag", to: "post#helper_tag", as: "helper_tag_post"
    get "/post/jsrender", to: "post#jsrender", as: "jsrender_post"
    #resources :post do
    #  collection do
    #    get 'helper_tag'
    #    get 'jsrender'
    #  end
    #end
    resources :plans
  end
end
