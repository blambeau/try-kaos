require 'spec_helper'
module TryKaos
  describe Model, "png_base64" do

    subject{ model.png_base64 }

    context 'when model is built from a path' do
      let(:path)  { Path.backfind("examples/minepump.kaos") }
      let(:model) { Model.new(path) }

      it{ should be_a(String) }

      it 'should not be empty' do
        (subject.size > 0).should be_true
      end
    end

  end
end
