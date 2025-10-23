job "docker-hello" {
  datacenters = ["dc1"]
  type = "batch"

  group "app" {
    task "hello" {
      driver = "docker"

      config {
        image = "alpine:latest"
        command = "echo"
        args    = ["Hello from Nomad on Linux container!"]
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
