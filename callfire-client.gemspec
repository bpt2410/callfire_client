$:.push File.expand_path("../lib", __FILE__)
require "version"
Gem::Specification.new do |s|
  s.name        = 'callfire-client'
  s.version     = Callfire::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Callfire Client"
  s.description = "Callfire Client gem provider"
  s.authors     = ["BPT2410"]
  s.email       = 'phutuong24101990@gmail.com'
  s.require_paths = ["lib"]
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{bin,lib,spec}/**/*")
  s.homepage    =
    'http://rubygems.org/gems/callfire-client'
  s.bindir='bin'
  s.executables='callfire'
end
