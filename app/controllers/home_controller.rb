class HomeController < ApplicationController
  def index
    @products = Product.all
  end

  def report
    orders = Order.where("created_at > ?", 30.days.ago)
    columns = Order.column_names

    csv = columns.to_sentence(:last_word_connector => ", ")
    orders.each do |order|
      csv << "\n" + order.values_at(columns).to_sentence(:last_word_connector => ", ")
    end

    send_data(csv.gsub("\"", ""), filename: "orders.csv")
  end
end
