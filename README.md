# FireHydrant Terraform Provider

![Banner](images/terraform-firehydrant.png)

![](https://github.com/firehydrant/terraform-provider-firehydrant/actions/workflows/ci.yml/badge.svg)

Welcome to the FireHydrant Terraform provider! With this provider you can create and manage resources on your [FireHydrant](https://www.firehydrant.io) organization such as incident runbooks, services, teams, and more!

To view the full documentation of this provider, we recommend reading the documentation on the [Terraform Registry](https://registry.terraform.io/providers/firehydrant/firehydrant/latest)

## Releasing

To release a new version, tag the commit with the prefered release tag, e.g. `v1.2.3`. A [buildkite pipeline](https://github.com/heap/heap/blob/develop/context/foundation/build_system/pipelines/bedrock-pipelines.tf) will run with the config found in .buildkite/buildkite.yml.

If the release does not show after a few minutes, check on the status of the release pipeline by searching [buildkite](https://buildkite.com/heap) for the pipeline named `terraform-provider-firehydrant`.
