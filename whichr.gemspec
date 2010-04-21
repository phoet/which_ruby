Gem::Specification.new do |s|
  s.name = 'wichr'
  s.version = '0.0.1'
  s.rubyforge_project = 'none'

  s.author = 'Peter Schröder'
  s.description = 'whichr is a simple helper for checking running Ruby engine'
  s.email = 'phoetmail@googlemail.com'
  s.homepage = 'http://github.com/phoet/wichr'
  s.summary = 'include whichr and use r_type or wich_r? :ruby methods'

  s.has_rdoc = true
  s.rdoc_options = ['-a', '--inline-source', '--charset=UTF-8']
  s.extra_rdoc_files = ['readme.textile']
  s.files = [ 'readme.textile', 'lib/whichr.rb' ]
  s.test_files = [ 'test/test_helper.rb', 'test/test_whichr.rb' ]
end