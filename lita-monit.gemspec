Gem::Specification.new do |spec|
  spec.name          = "lita-monit"
  spec.version       = "0.0.1"
  spec.authors       = ["Sergeev Peter"]
  spec.email         = ["petr@evercodelab.com"]
  spec.description   = %q{Lita handler for accepting and forwarding monit alerts}
  spec.summary       = %q{Lita handler for accepting and forwarding monit alerts}
  spec.homepage      = "https://github.com/toothfairy/lita-monit"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
