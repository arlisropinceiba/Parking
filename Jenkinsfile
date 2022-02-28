pipeline {
  //Donde se va a ejecutar el Pipeline
  agent {
    label 'Slave_Mac'
  }

  //Opciones específicas de Pipeline dentro del Pipeline
  options {
    buildDiscarder(logRotator(numToKeepStr: '3'))
 	  disableConcurrentBuilds()
  }

  //Aquí comienzan los “items” del Pipeline
  stages{
  
    stage('Compile') {
      steps {
        echo "------------>Compile<------------"
        sh 'xcodebuild -scheme Presentation clean build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED="NO"'
      }
    } 

    stage('Unit Tests') {
      steps{
        echo "------------>Unit Tests<------------"
        sh "xcodebuild -list"
        sh 'xcodebuild test -scheme Domain -configuration "Debug" -destination "platform=iOS Simulator,name=iPhone 12 Pro Max,OS=15.2"'
      }
    }

    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis estático de código<------------'
        sh 'run-sonar-swift.sh -h'
        sh 'swiftlint lint > swiftlint.txt || true'
        withSonarQubeEnv('Sonar') {
            sh "${tool name: 'SonarScanner-Mac', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner"
        }
      }
    }
  }

  post {
    failure {
      echo 'This will run only if failed'
      mail (to: 'arlin.ropero@ceiba.com.co',subject: "Failed Pipeline:${currentBuild.fullDisplayName}",body: "Something is wrong with ${env.BUILD_URL}")
    }
    success {
      echo 'This will run only if successful'
    }
  }
}
