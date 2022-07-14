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
            schemas = {
                ["https://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.ya?ml",
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "*cf*.ya?ml",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.ya?ml",
                ["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.ya?ml",
                ["https://json.schemastore.org/eslintrc.json"] = ".eslintrc.ya?ml",
                ["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.ya?ml",
                ["https://yarnpkg.com/configuration/yarnrc.json"] = ".yarnrc.ya?ml",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.ya?ml",
            },
    },
    }
}
