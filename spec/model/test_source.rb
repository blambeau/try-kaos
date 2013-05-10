require 'spec_helper'
module TryKaos
  describe Model, "source" do

    subject{ model.source }

    context 'when model is built from the source' do
      let(:source){ "declare agent\nend" }
      let(:model) { Model.new(source) }

      it{ should eq(source) }
    end

    context 'when model is built from a path' do
      let(:path)  { Path.backfind("examples/minepump.kaos") }
      let(:model) { Model.new(path) }

      it{ should eq(path.read) }
    end

  end
end
