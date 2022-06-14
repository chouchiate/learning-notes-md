## [gitlab] - .gitlab-ci.yml Reference

### keyword reference

| keyword | Description |
| ----- | ----- |
| default | custom default values for job keywords |
|include | import configuration from other YAML files |
| stages | the names and order of the pipeline stages |
| variables | define job variables on a job level |
| script | shell script that is executed by a runner |
| rules | list of conditions to evaluate ad determine selected attributes of a job, and whether or not it's created |


### rules
* to include or exclude jobs in pipelines
* evaluated in order until first match
* accepts an array of rules defined with
    - if
    - changes
    - exists
    - allow_failure
    _ variables
    - when


#### examples of rules:if
```yml
job:
  script: echo "Hello, Rules!"
  rules:
    - if: $CI_MERGE_REQUEST_SOURCE_BRANCH_NAME =~ /^feature/ && $CI_MERGE_REQUEST_TARGET_BRANCH_NAME != $CI_DEFAULT_BRANCH
      when: never
    - if: $CI_MERGE_REQUEST_SOURCE_BRANCH_NAME =~ /^feature/
      when: manual
      allow_failure: true
    - if: $CI_MERGE_REQUEST_SOURCE_BRANCH_NAME
```















```yml
#
# data collecting checker
#

data-collecting-checker:build:
  stage: build
  variables:
    IMAGE_NAME: space-data-collecting-checker
    DOCKER_FILE: docker/Dockerfile.data-collecting-checker
  script:
    - BRANCH_NAME=$CI_COMMIT_BRANCH
    - if [[ -z $BRANCH_NAME ]]; then BRANCH_NAME=$CI_MERGE_REQUEST_SOURCE_BRANCH_NAME; fi
    - TAG=gcr.io/$GCP_PROJECT/$PRODUCT_NAME/$IMAGE_NAME:$BRANCH_NAME-$CI_COMMIT_SHORT_SHA
    - docker build -f ./$DOCKER_FILE -t $TAG --build-arg CICD_ACCOUNT=$CICD_ACCOUNT --build-arg CICD_ACCESS_TOKEN=$CICD_ACCESS_TOKEN .
    - docker push $TAG
  rules:
    - if: $CI_COMMIT_REF_NAME == "master"
      changes:
        - "*"                     # shared files in root directory
        - data-collecting-checker/**/*.go  # application source
        - docker/Dockerfile.data-collecting-checker
```
### external
* [doc](https://docs.gitlab.com/ee/ci/yaml/)
