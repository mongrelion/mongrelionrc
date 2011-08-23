require 'rubygems'
require 'mongoid'
require 'wirble'

begin
  Mongoid.master = Mongo::Connection.new( 'localhost' ).db 'irb-test' unless defined? Rails
  # Fancy colors and history in the IRB = #win
  Wirble.init
  Wirble.colorize
rescue Mongo::ConnectionFailure
  puts 'MongoDB is currently not available.'
end

# Let's log all the db queries when in the rails console
if defined? ActiveRecord
  ActiveRecord::Base.logger = Logger.new $stdout
end
