# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: capistrano2-zabbix 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano2-zabbix"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Marek Skrobacki"]
  s.date = "2015-05-14"
  s.description = "\n  Tired of manually creating maintenance objects in your Zabbix monitoring\n  system for every new release of your application ? This gem is for you! It\n  automates creation and removal of necessary objects so that your code can be\n  released without unnecessary false alerts.\n  "
  s.email = "skrobul@skrobul.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rubocop.yml",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "capistrano2-zabbix.gemspec",
    "lib/capistrano/tasks.rb",
    "lib/capistrano2-zabbix.rb",
    "lib/zabbix_maintenance.rb",
    "spec/capistrano2-zabbix_spec.rb",
    "spec/cassettes/ZabbixMaintenance/_authenticated_/when_authenticated/.yml",
    "spec/cassettes/ZabbixMaintenance/_authenticated_/when_not_authenticated/returns_false.yml",
    "spec/cassettes/ZabbixMaintenance/_create/with_valid_parameters/creates_maintenance_period_with_correct_groupid.yml",
    "spec/cassettes/ZabbixMaintenance/_delete/removes_the_maintenance.yml",
    "spec/cassettes/ZabbixMaintenance/_exists_/when_maintenance_does_not_exist_on_remote_server/.yml",
    "spec/cassettes/ZabbixMaintenance/_exists_/when_maintenance_exists_on_remote_server/.yml",
    "spec/cassettes/ZabbixMaintenance/_maint_id/when_maintenance_exsts/returns_correct_ID.yml",
    "spec/cassettes/ZabbixMaintenance/_new/authenticates_with_correct_credentials.yml",
    "spec/spec_helper.rb",
    "spec/zabbix_maintenance_spec.rb"
  ]
  s.homepage = "http://github.com/skrobul/capistrano2-zabbix"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Create maintenances in Zabbix through Capistrano deployment"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<zabbixapi>, ["~> 2.2"])
      s.add_runtime_dependency(%q<capistrano>, ["~> 2.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.2.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.7"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<vcr>, ["~> 2.9"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<guard-rubocop>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
    else
      s.add_dependency(%q<zabbixapi>, ["~> 2.2"])
      s.add_dependency(%q<capistrano>, ["~> 2.0"])
      s.add_dependency(%q<rspec>, ["~> 3.2.0"])
      s.add_dependency(%q<yard>, ["~> 0.7"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<vcr>, ["~> 2.9"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<guard-rubocop>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<zabbixapi>, ["~> 2.2"])
    s.add_dependency(%q<capistrano>, ["~> 2.0"])
    s.add_dependency(%q<rspec>, ["~> 3.2.0"])
    s.add_dependency(%q<yard>, ["~> 0.7"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<vcr>, ["~> 2.9"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<guard-rubocop>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
  end
end

