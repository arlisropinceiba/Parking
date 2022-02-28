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
        //sh 'pod install' // Esta instrucción puede variar dependiendo del gestor de paquetes.
        sh 'xcodebuild -scheme Presentation clean build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED="NO"'
      }
    } 

    stage('Unit Tests') {
      steps{
        echo "------------>Unit Tests<------------"
        sh "xcodebuild -list"
        //sh 'xcodebuild test -scheme PresentationUITests -configuration "Debug" -destination platform="iOS Simulator", name="iPhone 13 Pro Max", OS=15.2'
        sh 'xcodebuild test -scheme DomainTests -configuration "Debug" -destination platform="iOS Simulator", name="iPhone 13 Pro Max", OS=15.2'
      }
    }

    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis de código estático<------------'
        sh 'swiftlint lint > swiftlint.txt || true'
        sh 'run-sonar-swift.sh -h'
        withSonarQubeEnv('Sonar') {
            sh "${tool name: 'SonarScanner-Mac', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner"
        }
      }
    }
  }
}
