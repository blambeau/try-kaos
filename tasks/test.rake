begin
  require "rspec/core/rake_task"
  desc "Run RSpec code examples"
  RSpec::Core::RakeTask.new(:test) do |t|
    t.pattern = "spec/**/test_*.rb"
    t.fail_on_error = true
    t.failure_message = nil
    t.verbose = true
    t.rcov = false
    t.rcov_path = "rcov"
    t.rcov_opts = []
    t.ruby_opts = []
    t.rspec_path = "rspec"
    t.rspec_opts = ["--color", "--backtrace"]
  end
rescue LoadError => ex
  task :test do
    abort 'rspec is not available. In order to run spec, you must: gem install rspec'
  end
ensure
  task :spec => [:test]
end
