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
  stage('Test') {
        agent {
        label 'master'
        }
        steps {
         sh "mvn test"
          echo 'Test cases executed successfully'
        }
      }

  stage('Docker') {
        agent {
        label 'master'
        }
        steps {
          sh "docker build -it apachetomcat:latest ."
          echo 'Docker image is created successfully'
        }
      }
  stage('publishi-image') {
        agent {
        label 'master'
        }
        steps {
          sh "docker login ravali1505"
          sh "docker tag apachetomcat:latest ravali1505/pipeline"
          sh "docker push ravali1505/pipeline "
          echo 'The image is successfully pushed'
        }
      }
}
