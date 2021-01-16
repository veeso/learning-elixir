# This example shows how to spawn an elixir process, which is a task
# They're used to run jobs/concurrent processes and they're extremely lightweight

pid = spawn fn -> 1 + 2 end
Process.alive(pid)
# Return pid of current process
self()
# It is possible to send messages to other processes
send self(), {:hello, "world"}
# Receive with:
receive do
  {:hello, msg} -> msg
  {:world, _msg} -> "won't match"
after
  1_000 -> "Inbox empty after 1 second"
end

# NOTE: use flush() to print and flush the inbox

# If we use spawn_link, if an error is raised by the job, this will propagate to parent
# This means the current process depends on the child
spawn_link fn -> raise "oops" end

# The task module reports better information about processes, and should be used instead of native functions
Task.start fn -> raise "oops" end
