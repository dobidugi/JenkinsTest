pipeline {
    agent any
    tools {
        nodejs "Node 18"
        git "git"
    }
    stages {
        stage('prepare') {
            steps {
                echo 'prepare'
                git branch: "${BRANCH}", credentialsId: "github", url: 'https://github.com/dobidugi/JenkinsTest.git'
            }
        }
        stage('build') {
            steps {
                    echo " build ~~~  ~~~ "
                    bat "npm install"
                    bat "npm run build"
            }
        }
        
        stage('pre-deploy') {
            steps {
                bat 'npm run kill'
            }
        }
        
    }
    post {
        success {
          bat 'serve -s -l 3000 build'
        }
    }  
}