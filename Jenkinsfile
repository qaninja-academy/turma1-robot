pipeline {
   agent any

   stages {
      stage("Tests") {
         steps {
            sh "robot -d ./results /specs/api"
         }
      }
   }
}