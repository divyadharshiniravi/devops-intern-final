# devops-intern-final
# DevOps Intern Final Assessment

**Name:** Divya Dharshini R  
**Date:** October 2025  
**Repository:** devops-intern-final  

# DevOps Intern Final Assessment

## Project: Food Calories Estimation Using Image Processing

This project demonstrates a DevOps workflow using Nomad, Docker, and GitHub Actions.

---

## 1. Environment

- OS: Windows 10/11  
- Nomad: 1.10.5  
- Docker: Desktop latest  
- Java: 21.0.1  
- Git: Latest  

Nomad started in dev mode:

```
nomad agent -dev -bind=0.0.0.0 -log-level=DEBUG
```

Node status:

```
ID        Node Pool  DC   Name  Status
ba632ed7  default    dc1  MSI   ready
```

---

## 2. Nomad Hello Job

`hello.nomad` (exec driver):

```
job "hello" {
  datacenters = ["dc1"]
  type = "batch"
  group "example" {
    task "hello" {
      driver = "exec"
      config {
        command = "echo"
        args    = ["Hello from Nomad!"]
      }
      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
```

Run and check logs:

```
nomad job run hello.nomad
nomad job status hello
nomad alloc logs -stdout <allocation_id>
```

Output:

```
Hello from Nomad!
```

---

## 3. Docker Job Attempt

`docker-hello.nomad` (docker driver):

```
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
```

**Issue:** Docker driver unhealthy on Windows:  
```
Docker is configured with Linux containers; switch to Windows Containers
```

---

## 4. GitHub Actions CI

Simple workflow `.github/workflows/ci.yml`:

```
name: CI
on:
  push:
    branches: [ main ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run tests
        run: echo "CI pipeline executed successfully"
```

---

## 5. Limitations

1. Docker Linux containers cannot run on Windows without WSL2 Linux backend.  
2. Docker driver shows unhealthy; only `exec` jobs succeed.

---

## 6. Repository Link

[https://github.com/divyadharshiniravi/devops-intern-final](https://github.com/divyadharshiniravi/devops-intern-final)

