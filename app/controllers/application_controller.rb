class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: "facturation@keycoopt.com", password: "superstrongpassword" ,except: :create
end
