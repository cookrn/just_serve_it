require "bundler"
require "rake/testtask"

Bundler::GemHelper.install_tasks

namespace :test do
  desc "Run ALL The Tests"
  Rake::TestTask.new(:unit) do |t|
    t.libs << "test"
    t.pattern = "test/unit/**/*_test.rb"
    t.verbose = true
  end
end

task :default => "test:unit"

