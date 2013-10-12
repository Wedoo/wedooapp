# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = %w[ong admin].map{ |symbol| [symbol.to_sym,Role.find_or_create_by(symbol: symbol)] }
roles = Hash[roles]

user_ong = User.find_or_create_by(email: '2020@wedoo.cl') do |u|
  u.password = "12345678"
  u.role = roles[:ong]
  u.confirmed_at = Date.new
end
user_admin = User.find_or_create_by(email: 'awesome_admin@wedoo.cl') do |u|
  u.password = "12345678"
  u.role = roles[:admin]
  u.confirmed_at = Date.new
end
