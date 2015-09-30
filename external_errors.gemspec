Gem::Specification.new do |s|
  s.name        = 'external_errors'
  s.version     = '1.0'
  s.date        = '2014-09-30'
  s.summary     = 'Adds non validator errors to active model'
  s.description = 'Adds non validator errors to active model'
  s.authors     = ['Willian van der Velde']
  s.email       = 'willian@hackerone.com'
  s.files       = ['lib/external_errors']
  s.homepage    = 'https://www.hackerone.com'
  s.license     = 'MIT'

  s.add_dependency 'activemodel'
  s.add_development_dependency 'minitest'
end
