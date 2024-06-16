pipeline {
    agent any

    environment {
        PYTHON_PATH = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'
        VENV = 'venv'
        ROBOT_TESTS_DIR = 'tests'
    }

    stages {
        stage('Check Python') {
            steps {
                script {
                    sh 'python3 --version || true'
                    sh 'which python3 || true'
                }
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ShalukhoDarya/robot_framework.git'
            }
        }

    stages {
        stage('Setup Python Environment') {
            steps {
                script {
                    sh "${env.PYTHON_PATH} -m venv ${env.VENV}"
                    sh "source ${env.VENV}/bin/activate"
                    sh "pip install --upgrade pip"
                    sh "pip install -r requirements.txt"
                }
            }
        }

        stage('Run Robot Tests on Chrome') {
            steps {
                script {
                    sh "source ${env.VENV}/bin/activate"
                    sh "robot --variable BROWSER:Chrome -d results/chrome ${env.ROBOT_TESTS_DIR}/"
                }
            }
        }

        stage('Run Robot Tests on Firefox') {
            steps {
                script {
                    sh "source ${env.VENV}/bin/activate"
                    sh "robot --variable BROWSER:Firefox -d results/firefox ${env.ROBOT_TESTS_DIR}/"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}