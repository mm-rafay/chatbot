/* resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "busybox wget -O /tmp/kubectl https://dl.k8s.io/release/v1.32.2/bin/linux/amd64/kubectl && chmod +x /tmp/kubectl && /tmp/kubectl version --client"
  }
}

resource "null_resource" "auth" {
  provisioner "local-exec" {
    command = "export RCTL_API_SECRET=${var.RCTL_API_SECRET} && export RCTL_API_KEY=${var.RCTL_API_KEY} && export RCTL_REST_ENDPOINT=${var.RCTL_REST_ENDPOINT} && export RCTL_PROJECT=${var.RCTL_PROJECT} && terraform plan"
  }
} */

/* resource "null_resource" "pwd" {
  provisioner "local-exec" {
    command = "pwd && ls"
  }
} */

 /* resource "rafay_namespace" "namespace" {
    metadata {
        name    = "private-chatbot"
        project = "gpu-paas-demo"
        labels = {
            "env" = "dev"
        }
        annotations = {
            "logging" = "enabled"
        }
    }
    spec {
        placement {
            labels {
            key   = "rafay.dev/clusterName"
            value = "gpu-paas-demo-cluster"
            }
        }
        resource_quotas {
            cpu_limits = "8Gi"
            memory_limits = "16Gi"
            cpu_requests = "8Gi"
            memory_requests = "16Gi"
            gpu_requests = "10"
            gpu_limits = "10"
            storage_requests = "50Gi"
        }
    }
} */

resource "rafay_workload" "web-chatbot" {
  metadata {
    name    = "web-chatbot"
    project = "mm-demo"
  }
  spec {
    namespace = "c-mm-xl"
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
}
