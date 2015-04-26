lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'steam-store-parser/version'
require 'rake'

Gem::Specification.new do |spec|
  spec.name          = "steam-store-parser"
  spec.version       = SteamStoreParser::VERSION
  spec.authors       = ["Victor Viale"]
  spec.email         = ["viale.victor@gmail.com"]
  spec.description   = %q{Parses Steam web store to get lists of games from categories, keywords}
  spec.summary       = %q{Steam web store parsing, game data scraping}
  spec.homepage      = "https://github.com/Koroeskohr/steam-store-parser"
  spec.license       = "MIT"

  spec.files         = FileList['lib/*.rb',
                                'bin/*',
                                '[A-Z]*',
                                'test/*'].to_a
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_dependency 'mysql2-cs-bind', '~> 0.0.6'
  spec.add_dependency 'rest-client', '~> 1.8'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.2'
end