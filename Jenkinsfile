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
      stage('build') {
       agent {
        label 'master'
       }
        steps {
          sh "mvn clean package"
          echo 'Build is suscess using maven'
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
      stage('Deployment') {
        steps {
          sshagent(['Deployment_13.126.4.190']) {
          sh """
          scp -rp /home/ec2-user/.jenkins/workspace/Deployment_Job/target/*.jar ec2-user@13.126.4.190:/opt/apache-tomcat-8.5.84/webapps
          ssh ec2-user@13.126.4.190 /opt/apache-tomcat-8.5.84/bin/shutdown.sh
          ssh ec2-user@13.126.4.190 /opt/apache-tomcat-8.5.84/bin/startup.sh
          """
          }
        }
      }
    }
}
