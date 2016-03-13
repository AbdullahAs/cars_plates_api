# == Route Map
#
# Prefix Verb URI Pattern       Controller#Action
# plates GET  /plates(.:format) api/v1/plates#index
#

Rails.application.routes.draw do
  api_version(  module: "api/v1",
                header: { name: "Accept",
                          value: "application/vnd.carsplates.com; version=1" }
                ) do
    resources :plates, only: [:index]
  end
end
