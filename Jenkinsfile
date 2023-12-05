pipeline {
    agent any
    tools {
        nodejs "Node 18"
    }
    stages {
        stage('test') {
            steps {
                echo " test "
            }
        }
        stage('build') {
            steps {
                echo " build ~~~  ~~~ "
                bat "npm install"
                bat "npm run build"
            }
        }
    }
    post {
        success {
            bat 'serve -s -l 3000 build'
        }
    }  
}