return {
  settings = {
    yaml = {
      redhat = { telemetry = { enabled = false } },
      format = {
        enable = false,
        bracketSpacing = false,
        printWidth = 90,
      },
      keyOrdering = false,
      hover = true,
      completion = true,
      schemaStore = {
        url = "https://www.schemastore.org/api/json/catalog.json",
        enable = true,
      },
      schemas = {
        ["kubernetes"] = "/*k8s.yaml",
        ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
        ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] =
        "docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] =
        "argocd-application.yaml",
      },
    },
  },
}
