pipeline {
  agent {
        label 'master'
    }
  stages { 
      //stage('clone') {
        //steps {
         // git branch: 'main', credentialsId: 'github-tocken', url: 'https://github.com/ganigapetaravali/multibranch.git'
          //echo 'Clone is susscessful from github'
       // }
     // }
   stage('Build') {
        agent {
        label 'master'
        }
        steps {
          sh "docker build -t apachetomcat:latest ."
          echo 'Docker image is created successfully'
        }
    }
   
   stage('publish-image') {
        agent {
        label 'master'
        }
        steps {
          sh "docker login -u ravali1505 -p ravali@123"
          sh "docker tag apachetomcat:latest ravali1505/pipeline"
          sh "docker push ravali1505/pipeline "
          echo 'The image is successfully pushed'
        }
      }
   }
  stage('Email-Notification') 
        {
            steps 
            {
               emailext mimeType: 'text/html',               
subject: "[Jenkins]${currentBuild.fullDisplayName}",               
to: "ravali.ganigapeta@testingxperts.com",             
body: """Please go to console output of ${BUILD_URL}input to approve or Reject"""    
             }
        }
}
