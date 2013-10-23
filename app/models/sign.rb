require 'csv'

class Sign < ActiveRecord::Base
  
  belongs_to :initiative, counter_cache: true
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true }, uniqueness: { scope: :initiative_id, allow_blank: true }
  validates :identifier, presence: true, rut: { allow_blank: true }, uniqueness: { scope: :initiative_id }
  
  scope :of_initiative, -> (initiative) { where(initiative: initiative) }
  
  
  def self.csv_header
    #Using ruby's built-in CSV::Row class
    #true - means its a header
    CSV::Row.new([:first_name, :last_name, :identifier, :email], ['Nombre', 'Apellido', 'RUT', 'E-mail'], true)
  end
  
  def to_csv_row
    CSV::Row.new([:first_name, :last_name, :identifier, :email], [first_name, last_name, identifier, email].map {|f| f.encode('ISO-8859-1')})
    # CSV::Row.new(first_name: first_name, last_name: last_name, identifier: identifier, email: email)
  end
  
  # def self.find_in_batches(filters, batch_size, &block)
  #   #find_each will batch the results instead of getting all in one go
  #   where(filters).find_each(batch_size: batch_size) do |sign|
  #     yield sign
  #   end
  # end
end
