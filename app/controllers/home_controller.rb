class HomeController < ApplicationController
  def index
    @products = Product.all
  end

  def report
    orders = Orders.where("created_at > ?", 30.days.ago)

    send_data(orders.to_csv, filename: "orders.csv")
  end
end
