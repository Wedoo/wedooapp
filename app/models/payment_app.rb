class PaymentApp < ActiveRecord::Base
  acts_as_superclass
  belongs_to :ong
end
