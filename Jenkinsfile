pipeline {
  //agent any
  agent {
  docker { 
            image 'sravangcpdocker/terraform:7'
            args '-u root:root'
        }
        }
  stages {
    stage('Hello') {
      steps {
        sh '''
            git clone https://github.com/sravan-github/terraform-postgress-gcp.git
            ls -ltr
            pwd
            export GOOGLE_APPLICATION_CREDENTIALS="./gcp-key.json"
            cd terraform-postgress-gcp/example
            ls -ltr
            terraform init
            terraform plan
            #terraform apply --auto-approve
            '''
      }
    }
  }
  post {
        always {
        	cleanWs deleteDirs: true
        }
    }
}
