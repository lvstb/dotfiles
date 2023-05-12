return {
    settings = {
        yaml = {
            format = {
                    enable = true,
            },
            redhat = {
                telemetry = {
                enabled = false
                }
            },
            hover = true,
            completion = true,
            validate = true,
            customTags = {
                "!fn",
                "!And",
                "!If",
                "!If Sequence",
                "!Not",
                "!Equals",
                "!Equals Scalar",
                "!Equals sequence",
                "!Or",
                "!FindInMap sequence",
                "!Base64",
                "!Cidr",
                "!Ref",
                "!Ref Scalar",
                "!Sub",
                "!GetAtt",
                "!GetAZs",
                "!ImportValue",
                "!Select",
                "!Split",
                "!Join sequence"
                },
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
            },
            schemas = require("schemastore").json.schemas(),
      },
    },
}
