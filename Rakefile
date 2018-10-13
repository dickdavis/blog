# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rake/testtask'
require 'rdoc/task'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task default: :test

Rails.application.load_tasks

RDoc::Task.new :rdoc do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md', 'app/**/*.rb', 'lib/*.rb', 'config/**/*.rb', 'test/**/*.rb')
  rdoc.title = 'Blog Documentation'
  rdoc.rdoc_dir = 'docs/'
  rdoc.options << '--all'
end
