$:.unshift File.expand_path("../lib", __FILE__)
require 'chairman/version'

Gem::Specification.new do |s|
  s.name              = "chairman"
  s.version           = CHAIRMAN_VERSION
  s.date              = ""
  s.summary           = "For turning markdown files into showoff presentations."
  s.homepage          = "http://github.com/travisvalentine/chairman"
  s.email             = "tvalent2@gmail.com"
  s.authors           = ["Travis Valentine"]
  s.add_dependency      "showoff"
  s.add_dependency      "sinatra", "~> 1.3"
  s.add_dependency      "redcarpet"
  s.add_dependency      "nokogiri"
  s.add_dependency      "json"
  s.add_dependency      "gli",">= 1.3.2"
  s.add_dependency      "parslet"
  s.add_development_dependency "mg"
  s.description       = <<-desc
  desc
end
