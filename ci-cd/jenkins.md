# Jenkins for CI/CD

Jenkins is a popular open-source automation server used to build, test, and deploy software.

## Key Concepts
- **Server:** The central Jenkins instance managing CI/CD.
- **Agent:** A worker machine that executes jobs.
- **Pipeline:** A suite of plugins that supports implementing and integrating continuous delivery pipelines into Jenkins.
- **`Jenkinsfile`:** A text file that defines the Jenkins pipeline and is checked into source control.

## Example Pipeline (`Jenkinsfile`)
```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                // e.g., sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                // e.g., sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                // e.g., sh './deploy.sh'
            }
        }
    }
}
```

## Common Use Cases
- Continuous Integration (CI)
- Continuous Delivery/Deployment (CD)
- Orchestrating complex automation workflows
- Integrating with a wide variety of tools and services via plugins. 