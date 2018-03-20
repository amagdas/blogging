1. Agents/Processes
- are the key ingredient in building fault tolerant and scalable apps
- are shared nothing execution contexts which are PREEMTIVELY scheduled across a set of OS threads
- intrinsically capable of running concurrently

2. Anatomy of a process(cont.)
- message box
- non shared working memory
- code path & own execution flow

3. Message box
- process may receive arbitrary messages and store them in the process's inbox
- filtered using pattern matching
- message passing ties the small programs into bigger ones

4. Non shared memory(most of the time)
- each process has it's own block of RAM
- when a process is done, the memory if freed O(1)
- you have to be aware of this and think how to keep the state in short lived processes so you can reclaim the memory fast
- you can set memory limits per process

5. Process execution
- modules are the unit of code organization
- processes are the unit of code execution
- when the code stops or errors, the process exits
- control the life span of a process, the main mechanism for reliability in Elixir

6. Message passing
`send receiver, message`
- posts the message to the receiver's inbox and returns the message
- delivery is not guaranteed
- receiver can be a pid, an atom for a named process, a tuple {atom, node} or a port
- message can be anything

7. Lifespan tracking
- linking - connects one process to another, if the process exists abnormally, the linked process will also crash
- monitoring - handle exit events instead of crashing via `:trap_exit` process flag
- `Supervisor.start_link(children, strategy)`

8. Challenges
- shared state
- order of execution

9. Distribution models
- local
- socket based

Demo1 - Spin:
- open 3 terminals and run `iex --sname spin1 --cookie abc`
- Node.ping && Node.list
- `elixirc spin.ex`
- in `:spin1@crafter` run `c "spin.ex"`
- `pid = Spin.start`
- do the same on `:spin2@crafter`
- `nl Spin`
- try again on :spin2 node
- spawn a node on :spin3 `pid2 = Node.spawn :spin3@crafter, Spin, :start, []`
- change the code a bit
- `elixirc spin.ex` && `c "spin.ex"`
- `nl Spin`

Demo2 - Grepex:
- `iex --sname node1 --cookie codecamp -S mix`
- `:observer.start`
- `:rpc.call(:"node2@crafter", Grepex.SearchServer, :search, [["elixir"], self()])`
- `GenServer.cast({IxQuick, :node3@crafter}, {:search, ["elixir"], self()})`
- query based routing

Demo3 - autocluster

Notes:
`nl Grepex` - deploy to other servers, beam must be present
pid = Node.spawn :node2@crafter, Grepex.SearchServer, :run, []
:rpc.call(:"node2@crafter", Grepex.SearchServer, :search, [["elixir"], self()])
`epmd -names`
