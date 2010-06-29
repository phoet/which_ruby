$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'which_ruby'

include WhichRuby

%w{jruby ruby ree rubinius}.each do |ru|
  puts "checking #{ru}?"
  check = send(:"#{ru}?")
  puts "  #{ru} is #{check}"
  puts "  with version #{version}" if check
end