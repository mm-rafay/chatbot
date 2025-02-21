/* resource "rafay_workload" "web-chatbot" {
  metadata {
    name    = "web-chatbot"
    project = "mm-demo"
  }
  spec {
    namespace = "default"
    version = "v0"
    placement {
      selector = "rafay.dev/clusterName=mm-nuc"
    }
    artifact {
      type = "Helm"
      artifact{
        values_paths {
          name = "file://values.yaml"
        }
        repository = "open-webui"
        chart_name = "open-webui"
        chart_version = "5.16.0"
      }
    }
  }
} */

resource "rafay_namespace" "pc-ns" {
  metadata {
    name    = "private-chatbot"
    project = "mm-demo"
  }
  spec {
    drift {
      enabled = false
    }
    placement {
      labels {
        key   = "rafay.dev/clusterName"
        value = "mm-nuc"
      }
    }
  }
}

resource "rafay_workload" "pc-deployment" {
  metadata {
    name    = "pc-deployment"
    project = "mm-demo"
  }
  spec {
    namespace = "private-chatbot"
    placement {
      selector = "rafay.dev/clusterName=mm-nuc"
      environment {
          name = "test-env"
      }
    }
    version = "v0"
    artifact {
      type = "Yaml"
      artifact {
        paths {
          name = "file://pc-deployment.yaml"
        }
      }
    }
  }
}

resource "rafay_workload" "pc-pvc" {
  metadata {
    name    = "pc-pvc"
    project = "mm-demo"
  }
  spec {
    namespace = "private-chatbot"
    placement {
      selector = "rafay.dev/clusterName=mm-nuc"
      environment {
          name = "test-env"
      }
    }
    version = "v0"
    artifact {
      type = "Yaml"
      artifact {
        paths {
          name = "file://pc-pvc.yaml"
        }
      }
    }
  }
}

resource "rafay_workload" "pc-svc" {
  metadata {
    name    = "pc-svc"
    project = "mm-demo"
  }
  spec {
    namespace = "private-chatbot"
    placement {
      selector = "rafay.dev/clusterName=mm-nuc"
      environment {
          name = "test-env"
      }
    }
    version = "v0"
    artifact {
      type = "Yaml"
      artifact {
        paths {
          name = "file://pc-svc.yaml"
        }
      }
    }
  }
}

resource "rafay_workload" "pc-ingress" {
  metadata {
    name    = "pc-ingress"
    project = "mm-demo"
  }
  spec {
    namespace = "private-chatbot"
    placement {
      selector = "rafay.dev/clusterName=mm-nuc"
      environment {
          name = "test-env"
      }
    }
    version = "v0"
    artifact {
      type = "Yaml"
      artifact {
        paths {
          name = "file://pc-ingress.yaml"
        }
      }
    }
  }
}

resource "rafay_workload" "ollama-statefulset" {
  metadata {
    name    = "ollama-statefulset"
    project = "mm-demo"
  }
  spec {
    namespace = "private-chatbot"
    placement {
      selector = "rafay.dev/clusterName=mm-nuc"
      environment {
          name = "test-env"
      }
    }
    version = "v0"
    artifact {
      type = "Yaml"
      artifact {
        paths {
          name = "file://ollama-statefulset.yaml"
        }
      }
    }
  }
}

resource "rafay_workload" "ollama-service" {
  metadata {
    name    = "ollama-service"
    project = "mm-demo"
  }
  spec {
    namespace = "private-chatbot"
    placement {
      selector = "rafay.dev/clusterName=mm-nuc"
      environment {
          name = "test-env"
      }
    }
    version = "v0"
    artifact {
      type = "Yaml"
      artifact {
        paths {
          name = "file://ollama-service.yaml"
        }
      }
    }
  }
}
