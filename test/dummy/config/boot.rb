gemfile = File.expand_path "#{ ROOT }/../../Gemfile" , __FILE__

if File.exist?(gemfile)
  ENV["BUNDLE_GEMFILE"] = gemfile
  begin
    require "bundler"
  rescue
    require "rubygems"
    require "bundler"
  ensure
    Bundler.setup
  end
end

just_serve_it_gem_path = File.expand_path "#{ ROOT }/../../lib" , __FILE__
$:.unshift just_serve_it_gem_path

