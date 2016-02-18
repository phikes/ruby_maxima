module RubyMaxima
  class Session
    attr_reader :commands
    attr_accessor :debug

    def initialize
      @commands = []
      @debug = false
    end

    def execute
      result = `maxima -r '#{commands.join ' '}'`
      puts result if @debug
      result.scan(
        /(?<=\(%o#{@commands.count}\)).*(?=\(%i\d*\))/m
      ).first.strip
    end

    def method_missing(method, *args, &block)
      translated_args = args.map {|arg| translate_argument arg }

      @commands << "#{method}(#{translated_args.join ','});"
    end

    private
    def translate_argument(arg)
      if arg.kind_of? Hash
        arg.map {|(key, value)| "#{translate_argument key} = #{translate_argument value}"}.join ','
      elsif arg.kind_of? Array
        '[' + arg.map {|element| translate_argument element}.join(',') + ']'
      else
        arg
      end
    end
  end
end
