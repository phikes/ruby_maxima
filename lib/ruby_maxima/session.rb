module RubyMaxima
  class Session
    attr_reader :commands
    attr_accessor :debug

    def initialize
      @commands = []
      @debug = false
    end

    def execute
      result = `maxima -r "#{commands.join ' '}"`
      puts result if @debug
      result.scan(
        /(?<=\(%o#{@commands.count}\)).*(?=\(%i\d*\))/m
      ).first.strip
    end

    def method_missing(method, *args, &block)
      translated_args = args.map do |arg|
        if arg.kind_of? Hash
          arg.map {|(key, value)| "#{key} = #{value}"}.join ','
        else
          arg.inspect
        end
      end

      @commands << "#{method}(#{translated_args.join ','});"
    end
  end
end
