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
      //stage('sonar-scan') {
       //agent {
        //label 'master'
       //}
        //steps {
         // sh "mvn clean package"
          //echo 'Build is suscess using maven'
        //}
      //}
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
          sh "docker build -it artifactoryname/tomcat8 ."
          echo 'Docker image is created successfully'
        }
      }
      
      stage('publishi-image') {
        agent {
        label 'master'
        }
        steps {
          sh "docker login artifactoryname"
          sh "docker push artifactoryname/tomcat8 "
          echo 'The image is successfully pushed'
        }
      }
      
      stage('Deployment') {
        steps {
          sshagent(['43.205.178.45_Slave']) {
          sh ""
          docker pull artifactoryname/tomcat8
          docker container run -it -d – name tomcatcontainer1 -p 8081:8080 artifactoryname/tomcat8
          ""
          }
        }
      }
    }
}
