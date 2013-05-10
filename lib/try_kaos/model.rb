module TryKaos
  class Model

    def initialize(source)
      case source
      when Path
        @tmpfile = source
      when String
        @tmpfile = Path.tmpfile
        @tmpfile.write(source)
      else
        raise ArgumentError, "Unable to use `#{source}` as a .kaos source"
      end
    end
    attr_reader :tmpfile

    def source
      @source ||= tmpfile.read
    end

    def agora_model
      @agora_model ||= Agora::Model.load(tmpfile, :kaos)
    end
    alias :agora :agora_model

    def dot_file
      @dot_file ||= Path.tmpfile.tap{|f| f.write(agora_model.to_dot) }
    end

    def png_file
      @png_file ||= begin
        f = Path.tmpfile
        `dot -q3 -Tpng -o #{f} #{dot_file}`
        f
      end
    end

    def png_base64
      Base64.encode64(png_file.read)
    end
  end
end
