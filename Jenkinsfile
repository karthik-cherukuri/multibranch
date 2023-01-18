pipeline {
  agent {
        label 'master'
    }
  stages { 
      stage('clone') {
        steps {
          git branch: 'main', credentialsId: 'github-tocken', url: 'https://github.com/ganigapetaravali/multibranch.git'
          echo 'Clone is susscessful from github'
        }
      }
  }
  stage('build'){
        agent {
        label 'master'
        }
        steps {
          sh "docker build -it apachetomcat:latest ."
          echo 'Docker image is created successfully'
        }
      }
}
