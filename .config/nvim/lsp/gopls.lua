return {
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = false,
      analyses = {
        unusedparams = true,
        shadow = true,
        unusedwrite = true,
        unusedvariable = true,
      },
      codelenses = {
        generate = true, -- Don't show the `go generate` lens.
        gc_details = true, -- Show a code lens toggling the display of gc's choices.
      },
      annotations = {
        escape = true,
        inline = true,
        bounds = true,
      },
    },
  },
}
