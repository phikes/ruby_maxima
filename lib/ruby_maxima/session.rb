module RubyMaxima
  class Session
    attr_reader :commands

    def initialize
      @commands = []
    end

    def method_missing(method, *args, &block)
      @commands << "#{method}(#{args.join ','})"
    end
  end
end
