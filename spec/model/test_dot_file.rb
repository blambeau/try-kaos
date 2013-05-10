require 'spec_helper'
module TryKaos
  describe Model, "dot_file" do

    subject{ model.dot_file }

    context 'when model is built from a path' do
      let(:path)  { Path.backfind("examples/minepump.kaos") }
      let(:model) { Model.new(path) }

      it{ should be_a(Path) }

      it 'should have expected content' do
        subject.read.should =~ /digraph/
      end
    end

  end
end
