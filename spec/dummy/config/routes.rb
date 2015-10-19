Rails.application.routes.draw do
  scope "(/:locale)", locale: /en|ja/ do
    resources :post , only: :index
    resources :plans
  end
end
