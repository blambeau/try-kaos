require 'spec_helper'
module TryKaos
  describe App, "locals" do
    include App::Helpers

    subject{ locals("about") }

    it{ should be_a(Hash) }

    it 'should have expected menu' do
      subject[:menu].should be_a(Array)
      subject[:menu].size.should eq(2)
    end

  end
end