require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup({
        builtin_matchers = {
          kubernetes = {
            enabled = true
          }
        },
        lspconfig = {
          flags = {
            debounce_text_changes = 150
          },
          settings = {
            redhat = {
              telemetry = {
                enabled = false
              }
            },
            yaml = {
              format = {
                enable = true
              },
              hover = true,
              schemaDownload = {
                enable = true
              },
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json"
              },
              schemas = {},
              trace = {
                server = "debug"
              },
              validate = true
            }
          },
          single_file_support = true
        },
        schemas = {},
      })
      require("lspconfig")["yamlls"].setup(cfg)
