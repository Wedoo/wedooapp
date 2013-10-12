class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, #:confirmable, #:registerable,
         :trackable, :timeoutable, :validatable, :lockable
  belongs_to :role
  
  
  def role_symbol
    role.nil? ? nil : role.symbol.to_sym
  end
  
  def role_symbols
    @role_symbols ||= role.nil? ? [] : [role.symbol.to_sym]
  end
  
end
