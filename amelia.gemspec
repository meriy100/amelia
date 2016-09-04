$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "amelia/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "amelia"
  s.version     = Amelia::VERSION
  s.authors     = ["meriy100"]
  s.email       = ["ttattataa@gmail.com"]
  s.homepage    = "https://github.com/meriy100/amelia"
  s.summary     = "Summary of amelia."
  s.description = "Description of amelia."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "activerecord", "~> 4.2"
  s.add_dependency "actionview", "~> 4.2"
  s.add_dependency "i18n"
  s.add_development_dependency "rails", "~> 4.2"

  s.add_development_dependency "sqlite3"

  # add use spec-rails
  s.add_development_dependency "rspec-rails"
end
