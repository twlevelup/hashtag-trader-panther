require 'rake/testtask'
require 'sinatra/activerecord/rake'
require_relative 'lib/app'

task :default => [:test]

desc "Run automated tests"
Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

desc "Run server locally"
task :server do
	thin_command = "thin start -R config.ru"
	if (ENV['OS'] =~ /Windows/)
		sh thin_command
	else
  	sh "rerun '#{thin_command}'"
  end
end