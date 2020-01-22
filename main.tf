locals {
  refresh = var.refresh == null ? "" : var.refresh
}

resource "kubernetes_cluster_role_binding" "default" {
  metadata {
    name = "kube-system-default-cluster-admin"
    annotations = {
      refresh = local.refresh
    }
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "kube-system"
  }
}
