require 'sinatra/base'
require 'sinatra/reloader'
require 'wlang/tilt'
require 'alf-core'

module TryKaos
  class App < Sinatra::Base

    set :root, Path.backfind('.[Gemfile]')
    set :wlang, layout: :html5

    module Helpers
      ExamplesPath = Path.backfind("examples")
      Menu = Relation([
        { position: 1, id: :home,    url: "/home",    label: "Home"    },
        { position: 2, id: :about,   url: "/about",   label: "About"   },
      ])
      Examples = Relation([
        { position: 1, id: :minepump, label: "Minepump",                 file: ExamplesPath/"minepump.kaos" },
        { position: 2, id: :las,      label: "London Ambulance Service", file: ExamplesPath/"las.kaos"  }
      ])

      def sort(x)
        x.to_a([[:position, :asc]])
      end

      def find_example_tuple(params)
        if src = params[:source]
          file = Path.tmpfile.tap{|f| f.write(src) }
          { position: 1, id: :user_defined, label: "User example", file: file }
        elsif ex=params[:example]
          Examples.restrict(->{ id.to_s == ex }).tuple_extract
        else
          Examples.to_a.sample
        end
      end

      def example_path(ex)
        Path.backfind("examples/#{ex[:id]}.kaos")
      end

      def locals(current_page, params = {})
        example  = find_example_tuple(params)
        menu     = sort(Menu.extend(active: ->(){ id == current_page }))
        examples = sort(Examples.extend(active: ->(){ id == example[:id] }))
        model    = Model.new(example[:file])
        { menu: menu, examples: examples, model: model }
      end
    end
    include Helpers

    get '/' do
      wlang :home, locals: locals(:home, params)
    end

    Helpers::Menu.each do |tuple|
      get tuple[:url] do
        wlang tuple[:id], locals: locals(tuple[:id], params)
      end
    end

  end # class App
end # module TryKaos
