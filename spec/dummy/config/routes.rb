Rails.application.routes.draw do
  scope "(/:locale)", locale: /en|ja/ do
    resources :post do
      collection do
        get 'helper_tag'
      end
    end
    resources :plans
  end
end
