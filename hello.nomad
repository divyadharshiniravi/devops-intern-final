job "hello" {
  datacenters = ["dc1"]
  type = "batch"

  group "example" {
    task "hello" {
      driver = "raw_exec"
      config {
        command = "echo"
        args    = ["Hello from Nomad!"]
      }
    }
  }
}
