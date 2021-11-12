# frozen_string_literal: true
#
require "logger"
require_relative "finitemachine/version"
require_relative "finitemachine/definition"

module Finitemachine
  IncorrectTransitionError = Class.new(::StandardError)

  def define(&block)
    StateMachine.new(Definition, &block)
  end
end

FiniteMachine.logger = Logger.new(STDERR)
