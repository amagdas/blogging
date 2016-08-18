# Import helpers for defining supervisors
import Supervisor.Spec

# Supervise the Stack server which will be started with
# a single argument [:hello] and the default registered
# name of MyStack.
children = [
  worker(Stack, [[:hello], [name: MyStack]])
]

# Start the supervisor with our child
{:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)

GenServer.call(MyStack, :pop)
#=> :hello

GenServer.cast(MyStack, {:push, :world})
#=> :ok

GenServer.call(MyStack, :pop)
#=> :world
