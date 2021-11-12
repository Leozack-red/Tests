
class StateMachine
  attr_accessor :evn, :state, :block, :arr_oper, :arr_trans

  def initialize(factory, &block)
    options = args.last.is_a?(::Hash) ? args.pop : {}
    block.call(&block) if block_given?
  end

  def target
    env.target
  end

  def events
    target
    yield
  end

  def event(operation, transition)
    arr_oper << operation
    arr_trans << transition
  end

  def current
    sync_shared { state }
  end

  def synchronize(mode, &block)
    lock = Sync.new
    lock.synchronize(mode, &block)
  end

  def sync_shared(&block)
    StateMachine.synchronize(:SH, &block)
  end

  def callbacks
    target
    yield
  end

  def on_before(operation)
    events == current ? puts true : raise(:StandardError)
    yield
  end

  def on_after(operation)
    events == previous ? puts true : raise(:StandardError)
    yield
  end
end
