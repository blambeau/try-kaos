require 'spec_helper'
module TryKaos
  describe App, "get /" do
    include Rack::Test::Methods

    before do 
      subject
    end

    subject{ get '/' }

    it 'works' do
      last_response.status.should eq(200)
    end

    it 'renders the html5 template' do
      last_response.body.should =~ /<html/
    end

    it 'render the menu' do
      last_response.body.should =~ /<nav/
    end

    it 'renders the form' do
      last_response.body.should =~ /<form/
      last_response.body.should =~ /<textarea/
    end

  end
end
