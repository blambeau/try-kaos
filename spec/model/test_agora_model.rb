require 'spec_helper'
module TryKaos
  describe Model, "agora_model" do

    subject{ model.agora_model }

    context 'when model is built from a path' do
      let(:path)  { Path.backfind("examples/minepump.kaos") }
      let(:model) { Model.new(path) }

      it{ should be_a(Agora::Model) }
    end

  end
end
