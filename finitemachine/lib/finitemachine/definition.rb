
class Definition
  attr_accessor :instance

  def initialize(arg, &block)
    @instance = Finitemachine.new(*arg)
  end

end
