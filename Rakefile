# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "capistrano2-zabbix"
  gem.homepage = "http://github.com/skrobul/capistrano2-zabbix"
  gem.license = "MIT"
  gem.summary = %Q{Create maintenances in Zabbix through Capistrano deployment}
  gem.description = %Q{
  Tired of manually creating maintenance objects in your Zabbix monitoring
  system for every new release of your application ? This gem is for you! It
  automates creation and removal of necessary objects so that your code can be
  released without unnecessary false alerts.
  }
  gem.email = "skrobul@skrobul.com"
  gem.authors = ["Marek Skrobacki"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
