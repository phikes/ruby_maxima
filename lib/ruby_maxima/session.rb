module RubyMaxima
  class Session
    attr_reader :commands

    def initialize
      @commands = []
    end

    def execute
      `maxima -r "#{commands.join ' '}"`.scan(
        /(?<=\(%o#{@commands.count}\)).*/
      ).first.strip
    end

    def method_missing(method, *args, &block)
      @commands << "#{method}(#{args.map(&:inspect).join ','});"
    end
  end
end
