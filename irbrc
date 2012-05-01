require 'rubygems'
begin
  # Fancy colors and history in the IRB = #win
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue Exception => e
end

begin
  require 'mongoid'
  Mongoid.master = Mongo::Connection.new('localhost', 27017, logger: Logger.new($stdout)).db 'irb-test' unless defined? Rails
rescue Exception => e
end

# Let's log all the db queries when in the rails console
if defined? ActiveRecord
  ActiveRecord::Base.logger = Logger.new $stdout
end
