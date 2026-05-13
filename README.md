# supabase-gitops-sdl-flow

This repository demonstrates how to use Bytebase and GitHub actions to do database release CI/CD with a code base following [GitHub flow](https://docs.github.com/en/get-started/using-github/github-flow).

🔗 Tutorial: [GitOps with GitHub Workflow](https://docs.bytebase.com/tutorials/gitops-github-workflow)

For GitHub flow, feature branches are merged into the main branch and the main branch is deployed to the, for example, "test" and "prod" environments in a deploy pipeline.

[sql-review-action.yml](/.github/workflows/sql-review-action.yml) checks the SQL migration files against the databases when pull requests are created.

[release-action.yml](/.github/workflows/release-action.yml) builds the code and then for each environment migrate the databases and deploy the code. Using [environments with protection rules](https://docs.github.com/en/actions/managing-workflow-runs-and-deployments/managing-deployments/managing-environments-for-deployment#required-reviewers), it can deploy to the test environment automatically and push to the prod environment after approval.
