defmodule StackSupervisor do
  # Import helpers for defining supervisors
  import Supervisor.Spec

  def run do
    # Supervise the Stack server which will be started with
    # a single argument [:hello] and the default registered
    # name of MyStack.
    children = [
      worker(StackGenServer, [[:hello], [name: MyStack]])
    ]

    # Start the supervisor with our child
    {:ok, _} = Supervisor.start_link(children, strategy: :one_for_one)
  end

  def pop do
    GenServer.call(MyStack, :pop)
  end

  def push(value) do
    GenServer.cast(MyStack, {:push, value})
  end

end
