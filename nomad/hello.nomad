job "hello" {
  datacenters = ["dc1"]
  type = "service"

  group "hello-group" {
    task "hello-task" {
      driver = "docker"
      config {
        image = "python:3.11-slim"
        command = "python"
        args = ["hello.py"]
      }
      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
