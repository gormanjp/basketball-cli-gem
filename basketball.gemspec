# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'basketball/version'

Gem::Specification.new do |spec|
  spec.name          = "basketball"
  spec.version       = Basketball::VERSION
  spec.authors       = ["gormanjp"]
  spec.email         = ["jpgorman8@gmail.com"]

  spec.summary       = %q{Top 25 college bball team info}
  spec.description   = %q{Lists the top 25 basketball teams and allows you to check out more info on each team like tweets and schedules.}
  spec.homepage      = "https://github.com/gormanjp/basketball-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
