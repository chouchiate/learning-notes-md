## [aws] - github ci cd deployment

This tutorial assumes you are familiar with git commands, npm , AWS and you have a working web app that is ready to be deployed. The goal of setting up the CI/CD pipeline is to deploy your Web app to AWS S3 everytime a commit is made to the master branch.

### What is cicd
CI/CD comprises series of steps that are going to be executed automatically every single time we make a change to the code and then push those changes up to GitHub.

### Goad of CICD
The goal of CI/ CD is to make sure that any time we make changes to the code, we have some process that is going to automatically run the CI build of the package and then automatically attempt to deploy that change off to our infrastructure. To implement CI/CD pipeline, we’re going to be making use of something called [GitHub actions](https://docs.github.com/en/actions)

### What is Github Action
Configure code to automatically run any time that you commit some code on your machine and then push it up to GitHub.

* Any time a pull/merge request is created or closed,
* Anytime code gets merged into your primary branch,
* On some set schedule, for example setup a build to run every day at 9AM.
* Any time an issue is created or closed.

### Configuring a Workflow
* Create a .github/workflows directory in your repository on GitHub if this directory does not already exist.

*nIn the .github/workflows directory, create a file named github-actions-demo.yml. For more information, see "Creating new files."

* Copy the following YAML contents into the github-actions-demo.yml file:
```yml
name: GitHub Actions Demo
on: [push]
jobs:
  Explore-GitHub-Actions:
    runs-on: ubuntu-latest
    steps:
      - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
      - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
      - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
      - name: Check out repository code
        uses: actions/checkout@v3
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready to test your code on the runner."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - run: echo "🍏 This job's status is ${{ job.status }}."

```
