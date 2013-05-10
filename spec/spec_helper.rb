require 'rspec'
require 'rack/test'
require 'try_kaos'

module Helpers

  def app
    TryKaos::App.set :environment, :test
    TryKaos::App
  end

end

RSpec.configure do |c|
  c.include(Helpers)
end
