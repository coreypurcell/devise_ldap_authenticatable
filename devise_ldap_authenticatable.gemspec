# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "devise_ldap_authenticatable/version"

Gem::Specification.new do |s|
  s.name        = "devise_ldap_authenticatable"
  s.version     = "0.0.1"
  s.authors     = ["Corey Purcell"]
  s.email       = ["corey.purcell@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "devise_ldap_authenticatable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "devise", "=1.0.8"
  s.add_dependency "net-ldap"
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
