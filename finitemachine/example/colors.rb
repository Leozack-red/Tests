
require_relative "../lib/finitemachine"

fm = Finitemachine.define do
  initial :red

  events {
    event :ready, :red    => :yellow
    event :go,    :yellow => :green
    event :stop,  :green  => :red
  }

  callbacks {
    on_before(:ready) { |event| puts 'before ready' }
    on_after(:go)     { |event| puts 'after go.' }
    on_before(:go) { |event| puts 'before go' }
    on_before(:stop)  { |event| puts 'before stop'  }
  }
end

fm.state # => red
fm.ready # => true, prints “before ready”
fm.state # => yellow
fm.go # => true prints “before go”, “after go”
fm.state # => green
fm.ready # => raise FiniteMachine::IncorrectTransitionError
