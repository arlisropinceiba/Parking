pipeline {
  //Donde se va a ejecutar el Pipeline
  agent  {
    label 'Slave_Mac'
  }

  //Opciones específicas de Pipeline dentro del Pipeline
  options {
 	    disableConcurrentBuilds()
  }

  //Aquí comienzan los “items” del Pipeline
  stages{

    stage('Compile') {
        steps {
            echo "------------>Compile<------------"
            //sh 'pod install'
            sh 'xcodebuild -scheme Presentation clean build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED="NO"'
        }
    }

    stage('Unit Tests') {
        steps{
            echo "------------>Unit Tests<------------"
            sh "xcodebuild test -scheme Domain -destination 'platform=iOS Simulator,name=iPhone 12 Pro,OS=14.5'"
            sh 'run-sonar-swift.sh'
        }
    }

    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis estático de codigo<------------'
        withSonarQubeEnv('Sonar') {
            sh "${tool name: 'SonarScanner-Mac', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner"
        }
      }
    }
  }
}
