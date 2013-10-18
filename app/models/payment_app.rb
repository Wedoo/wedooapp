class PaymentApp < ActiveRecord::Base
  acts_as_superclass rescue nil
  belongs_to :ong
  validates_uniqueness_of :ong_id, message: "Puedes tener solo una app de paypal"
end
