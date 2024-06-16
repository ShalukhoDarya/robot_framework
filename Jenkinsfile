pipeline {
    agent any

    environment {
        // Задаем переменную окружения для пути к Python
        PYTHON_PATH = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'
        VENV = 'venv'
        ROBOT_TESTS_DIR = 'tests'
    }

    stages {
        stage('Check Python') {
            steps {
                script {
                    // Проверка версии Python 3
                    sh 'python3 --version || true'
                    // Проверка версии Python 2
                    sh 'python --version || true'
                    sh 'which python3 || true'
                    sh 'which python || true'
                }
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ShalukhoDarya/robot_framework.git'
            }
        }

        stage('Setup Python Environment') {
            steps {
                script {
                    // Создание виртуального окружения Python
                    sh "python3 -m venv --clear ${VENV}"
                    // Активация виртуального окружения
                    sh "source ${VENV}/bin/activate"
                    // Обновление pip и установка зависимостей из requirements.txt
                    sh "pip install --upgrade pip"
                    sh "pip install -r requirements.txt"
                }
            }
        }

        stage('Run Robot Tests on Chrome') {
            steps {
                script {
                    // Активация виртуального окружения
                    sh "source ${VENV}/bin/activate"
                    // Запуск тестов Robot Framework в Chrome
                    sh "robot --variable BROWSER:Chrome -d results/chrome ${ROBOT_TESTS_DIR}/"
                }
            }
            post {
                always {
                    // Сохранение результатов тестов
                    archiveArtifacts artifacts: 'results/chrome/*.xml', allowEmptyArchive: true
                    // Публикация отчета о тестировании
                    publishHTML target: [
                        allowMissing: false,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'results/chrome',
                        reportFiles: 'report.html',
                        reportName: 'Chrome Test Report'
                    ]
                }
            }
        }

        stage('Run Robot Tests on Firefox') {
            steps {
                script {
                    // Активация виртуального окружения
                    sh "source ${VENV}/bin/activate"
                    // Запуск тестов Robot Framework в Firefox
                    sh "robot --variable BROWSER:Firefox -d results/firefox ${ROBOT_TESTS_DIR}/"
                }
            }
            post {
                always {
                    // Сохранение результатов тестов
                    archiveArtifacts artifacts: 'results/firefox/*.xml', allowEmptyArchive: true
                    // Публикация отчета о тестировании
                    publishHTML target: [
                        allowMissing: false,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'results/firefox',
                        reportFiles: 'report.html',
                        reportName: 'Firefox Test Report'
                    ]
                }
            }
        }
    }

    post {
        always {
            // Очистка рабочего пространства после сборки
            cleanWs()
        }
    }
}