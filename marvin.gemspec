# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{marvin}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vinkesh Banka"]
  s.date = %q{2011-01-23}
  s.description = %q{Marvin handles vanilla code to create your own chat bot. You just need to plug in your commands.}
  s.email = %q{vinkesh.banka@gmail.com}
  s.files = Dir['lib/**/*.rb'] + Dir['spec/**/*.rb'] + Dir['examples/**/*.rb'] + ["Gemfile", "LICENSE.txt", "Rakefile", "README.rdoc"]
  s.require_paths = ["lib"]
  s.summary = %q{helps Hosting your Chat Bot}
  s.add_dependency('xmpp4r')
  s.add_dependency('eventmachine')

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
