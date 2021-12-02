// nodejs-lib:1.2.0 DO-NOT-REMOVE
def image
def version
def fullVersion
def chartVersion
pipeline {
  agent any
  
  options {
    buildDiscarder(logRotator(daysToKeepStr: '7', artifactDaysToKeepStr: '7'))
  }

  environment {
    REPOSITORY_NAME = "${env.GIT_URL.tokenize('/')[3].split('\\.')[0]}"
    REPOSITORY_OWNER = "${env.GIT_URL.tokenize('/')[2]}"
    GIT_COMMIT_SHORT = "${env.GIT_COMMIT[0..7]}"
    NODEJS_HOME = tool name: 'nodejs-12.16.3'
    PATH = "$NODEJS_HOME/bin:$PATH"
  }

  stages {
    stage('Checkout') {
      steps {
        deleteDir()
        checkout scm
      }
    }
    
    stage('Set Full Version') {
      steps {
        script {
          version = sh(script: 'node -e "console.log(require(\'./package.json\').version);"', returnStdout: true).trim()

          if (env.TAG_NAME) {
            if (!env.TAG_NAME.contains(version)) {
              error "Git tag '${env.TAG_NAME}' does not match package.json version '${version}'"
            }

            // Format: <major>.<minor>.<patch>
            fullVersion = version
            chartVersion = version
          } else {
            // Format: <major>.<minor>.<patch>-<branch>.<commit hash>
            def branch_short = env.GIT_BRANCH.replaceAll('[^a-zA-Z0-9 ]+', '').toLowerCase().take(64)
            fullVersion = "${version}-${branch_short}.${env.GIT_COMMIT[0..7]}"
            chartVersion = "${version}-${branch_short}"
          }

          jsonfile = readJSON file: 'package.json'
          jsonfile['version'] = "${fullVersion}".toString()
          writeJSON file: 'package.json', json: jsonfile
          echo 'Updated package.json with new version:'
          sh 'cat package.json'
        }
      }
    }

    stage('Build') {
      steps {
        sh 'mkdir -p scan_dependencies && cp package* scan_dependencies && cd scan_dependencies && npm install && ls node_modules'
        sh 'npm prune && npm ci'
      }
    }

    stage('Test') {
      when { equals expected: true, actual: false }
      steps {
        script {
          try {
            sh '''#!/bin/bash
            npm run audit --audit-level=high
            npm run lint
            npm run test
            npm i -D mocha-sonar-generic-test-coverage
            '''
          } catch (exc) {
            echo 'Tests failed'
            currentBuild.result = 'UNSTABLE'
          }
        }
      }
    }

    stage('Dependency Check') {
      steps {
        dependencyCheck additionalArguments: "--cveValidForHours 48 --prettyPrint --scan scan_dependencies --format ALL ${fileExists('owasp-suppression.xml') ? '--suppression owasp-suppression.xml' : ''} --disableAssembly", odcInstallation: 'dependency-check-5.3.2'
        dependencyCheckPublisher pattern: '', unstableTotalHigh: 1, unstableTotalCritical: 1
        archiveArtifacts allowEmptyArchive: true, artifacts: '**/dependency-check-report.html', onlyIfSuccessful: false
      }
    }

    stage('Sonar') {
      when { equals expected: true, actual: false }
      steps {
        script {
          withSonarQubeEnv('mss-sonar') {
            sh '''#!/bin/bash
            npm install -g sonarqube-scanner
            CURRENT_BRANCH=${GIT_BRANCH}
            if [[ "${GIT_BRANCH}" != "master" && "${GIT_BRANCH}" != "develop" ]]; then
              # Check to see if repo has an develop branch
              hasBranch=`git branch -a | grep "remotes/origin/develop"`
              if [ "${hasBranch}" != "" ]; then
                TARGET_BRANCH="develop"
              else
                TARGET_BRANCH="master"
              fi
            elif [[ "${GIT_BRANCH}" == "develop" ]]; then
              TARGET_BRANCH="master"
            elif [[ "${GIT_BRANCH}" == "master" ]]; then
              TARGET_BRANCH=""
              CURRENT_BRANCH=""
            fi
            sonar-scanner \
              -Dsonar.projectKey="${REPOSITORY_OWNER}:${REPOSITORY_NAME}" \
              -Dsonar.language=js \
              -Dsonar.dependencyCheck.reportPath=./dependency-check-report.xml \
              -Dsonar.dependencyCheck.htmlReportPath=./dependency-check-report.html \
              -Dsonar.branch.name=${CURRENT_BRANCH} \
              -Dsonar.branch.target=${TARGET_BRANCH} \
              -Dsonar.exclusions=node_modules/**,cypress/**,chart/**,dependency-check*,*scan-results/**,coverage/**,config/**,data/**,venv/**,package-lock.json \
              -Dsonar.sources=.
              '''
          }
        }
      }
    }

    stage('Quality Gate') {
      when { equals expected: true, actual: false }
      steps {
        script {
          def qg = waitForQualityGate()
          if (qg.status != 'OK') {
            def msg =  "Pipeline aborted due to quality gate failure: ${qg.status}"
            if (env.TAG_NAME) {
              error msg
            } else {
              unstable msg
            }
          }
        }
      }
    }

    stage('Publish') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: 'mss-artifactory-credentials', usernameVariable: 'ARTIFACTORY_USERNAME', passwordVariable: 'ARTIFACTORY_PASSWORD')]) {
            sh '''#!/bin/bash
              BASE64_PASSWORD=`printf ${ARTIFACTORY_PASSWORD} | base64`
              npm config set @mss:registry https://na.artifactory.swg-devops.com/artifactory/api/npm/mss-npm/
              npm config set //na.artifactory.swg-devops.com/artifactory/api/npm/mss-npm/:_password="${BASE64_PASSWORD}"
              npm config set //na.artifactory.swg-devops.com/artifactory/api/npm/mss-npm/:username="${ARTIFACTORY_USERNAME}"
              npm config set //na.artifactory.swg-devops.com/artifactory/api/npm/mss-npm/:email="${ARTIFACTORY_USERNAME}"
              npm config set //na.artifactory.swg-devops.com/artifactory/api/npm/mss-npm/:always-auth=true

              npm publish
            '''
          }
        }
      }
    }

  }
}
