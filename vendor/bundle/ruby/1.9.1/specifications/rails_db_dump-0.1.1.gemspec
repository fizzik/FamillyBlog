# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails_db_dump"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Leonid Shevtsov"]
  s.date = "2011-02-22"
  s.description = "rails_db_dump is a wrapper for the native dumper of whatever database engine you're using, taking access parameters from database.yml. Supports mysql, postgresql and sqlite at the moment."
  s.email = ["leonid@shevtsov.me"]
  s.homepage = "https://github.com/leonid-shevtsov/rails_db_dump"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "dump your Rails database with a simple rake task"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
