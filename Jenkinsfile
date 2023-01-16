pipeline{
  agent any
  
  stages{
    stage('checkout'){
      steps{
         checkout([$class: 'GitSCM', branches: [[name: '**']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/ganigapetaravali/multibranch.git']]])
      }
    }
