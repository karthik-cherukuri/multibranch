pipeline {
  agent {
        label 'master'
    }
  // test
    stages { 
      stage('clone') {
        steps {
          git branch: 'main', credentialsId: 'github-tocken', url: 'https://github.com/ganigapetaravali/multibranch.git'
          echo 'Clone is susscessful from github'
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
          sh "docker build -it ravali1505/pipeline1 ."
          echo 'Docker image is created successfully'
        }
      }
      
      stage('publishi-image') {
        agent {
        label 'master'
        }
        steps {
          sh "docker login ravali1505"
          sh "docker push ravali1505/pipeline "
          echo 'The image is successfully pushed'
        }
      }
      
      stage('Deployment') {
        steps {
          sshagent(['43.205.178.45_Slave']) {
          sh ""
          docker pull ravali1505/pipeline
          docker container run -it -d – name tomcatcontainer1 -p 8787:8080 ravali1505/pipeline
          ""
          }
        }
      }
    }
}
