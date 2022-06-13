class Customer < ApplicationRecord
  before_save :strip_contact_phone

  private
  def strip_contact_phone
    self.phone.to_s.gsub!(/[^0-9]/, '')
  end
end
