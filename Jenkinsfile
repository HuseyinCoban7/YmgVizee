pipeline {
    agent any

    environment {
        PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;${env.PATH}"
        IMAGE_NAME = 'vizee_iamge'
        CONTAINER_NAME = 'vizee_container'
    }

    triggers {
        githubPush()
    }

    stages {
        stage("Clone") {
            steps {
                git url: 'https://github.com/HuseyinCoban7/YmgVizee.git', branch: 'main'
            }
        }

        stage("Build Docker Image") {
            steps {
                echo "Build Docker File"
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage("Önceki Containerları Sil") {
            steps {
                echo "Önceki Containerları Sil"
                bat "docker rm -f ${CONTAINER_NAME} || exit 0"
            }
        }

        stage("Docker Run işlemi Gerçekleştir") {
            steps {
                echo "Docker Container Run İşlemi"
                bat "docker run -d --name ${CONTAINER_NAME} -p 4444:80 ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo "başarılı bir şekilde çalıştı : http://localhost:4444"
        }
    }
}