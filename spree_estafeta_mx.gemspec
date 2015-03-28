# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_estafeta_mx'
  s.version     = '2.2.8'
  s.summary     = 'Estafeta waybills creation and monitoring for shipped status services integration with spreecommerce'
  s.description = 'Estafeta web services integration, this enable to the store to request waybills and be assigned to shipments'
  s.description += ' in ready status and that has not already a waybill assigned. it also contains an action to perform queries'
  s.description += ' regarding to already marked as shipped by Estafeta'
  s.required_ruby_version = '>= 1.9.3'

   s.author    = 'Jose Elias Martínez Sedano'
   s.email     = 'eliasmsedano@gmail.com'
   s.homepage  = 'https://github.com/emsedano/spree_estafeta_mx'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.2.8'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
