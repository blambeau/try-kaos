require 'spec_helper'
module TryKaos
  describe App, "get /about" do
    include Rack::Test::Methods

    before do 
      subject
    end

    subject{ get '/about' }

    it 'works' do
      last_response.status.should eq(200)
    end

    it 'renders the html5 template' do
      last_response.body.should =~ /<html/
    end

    it 'render the menu' do
      last_response.body.should =~ /<nav/
    end

  end
end
