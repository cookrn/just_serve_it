require "bundler"
require "rake/testtask"

Bundler::GemHelper.install_tasks

desc "Run All The Tests"
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.verbose = true
end
task :default => :test

