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
        /(?<=\(%o#{@commands.count}\)).*(?=\n\(%i\d*\))/
      ).first.strip
    end

    def method_missing(method, *args, &block)
      @commands << "#{method}(#{args.map(&:inspect).join ','});"
    end
  end
end
