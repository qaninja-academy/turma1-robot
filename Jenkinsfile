pipeline {
   agent {
       docker {
           image "python"
           args "--network=skynet"
       }
   }

   stages {
      stage("Build") {
          steps {
              sh "pip install -r requirements.txt"
          }
      }
      stage("Tests") {
         steps {
            sh "robot -d ./results specs/api"
         }
      }
   }
}
