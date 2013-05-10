require 'spec_helper'
module TryKaos
  describe Model, "png_file" do

    subject{ model.png_file }

    context 'when model is built from a path' do
      let(:path)  { Path.backfind("examples/minepump.kaos") }
      let(:model) { Model.new(path) }

      it{ should be_a(Path) }

      it 'should not be empty' do
        (subject.size > 0).should be_true
      end
    end

  end
end
