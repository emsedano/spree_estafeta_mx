Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    match "/estafeta/create-label", to: "estafeta#create_label", via: :post, :as => :create_label
    match "/estafeta/download", to: "estafeta#download_waybill", via: :put, :as => :download_waybill
  end
end
