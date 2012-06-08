Gem::Specification.new do |s|
  s.name          = 'twitter_analyzer'
  s.version       = '0.1.1'
  s.summary       = 'Determine which words occur most frequently in a user\'s tweets'
  s.description   = 'Takes an arbitrary username, gets the top 1000 tweets then returns the most frequently occuring words'
  s.authors       = ["Zach Morek"]
  s.email         = ["zmorek@gmail.com"]
  s.homepage      = "https://github.com/ZachBeta/twitter_analyzer" 
  s.files         = [ 'lib/twitter_analyzer.rb' ]
  s.add_runtime_dependency 'twitter'
  s.add_development_dependency 'rspec', '~> 2.9.0'
  s.add_development_dependency 'rake', '~> 0.9.2'
  s.add_development_dependency 'ruby-debug19'
  s.test_files    = Dir.glob('spec/*_spec.rb')
  s.license       = 'GPLv3'
end
