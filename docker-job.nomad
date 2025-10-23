job "docker-hello" {
  datacenters = ["dc1"]
  type = "service"

  group "app" {
    task "web" {
      driver = "docker"

      config {
        image = "nginx:latest"
        ports = ["http"]
      }

      resources {
        network {
          port "http" {
            static = 8080
          }
        }
      }
    }
  }
}
