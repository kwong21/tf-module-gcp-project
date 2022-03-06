## Terrform Module - GCP Project

This module is used to create a project in GCP

## Usage

Create a module with this repo as the source

`source = "github.com/kwong21/tf-module-gcp-project"`

## Variables

### Input
```
"billing_account" = GCP billing account associated with the project
"org_id" = Organization that the project belongs to
"project_name" = Project name
"services_list" = List of services to enable
```

### Output
```
"project_id" = The created project ID 