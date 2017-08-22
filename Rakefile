# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rdoc/task'

Rails.application.load_tasks

RDoc::Task.new :rdoc do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md', 'app/**/*.rb', 'lib/*.rb', 'config/**/*.rb', 'test/**/*.rb')
  rdoc.title = 'Togify Documentation'
  rdoc.rdoc_dir = 'docs/'
  rdoc.options << '--all'
end
