class Admin::DashboardController < ApplicationController
  # app/controllers/application_controller.rb
  # http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], 
  # password: ENV["HTTP_BASIC_PASSWORD"]\
  # p ENV['USER1'], ENV['PASSWORD1']
  http_basic_authenticate_with :name => ENV['USER1'], :password => ENV['PASSWORD1']
  # p ENV
  
  def show
    @count_products = Product.count
    @count_categories = Category.count
  end
end