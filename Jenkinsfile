pipeline {
    agent any

    environment {
        ROBOT_TESTS_DIR = 'tests'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the correct branch
                git branch: 'main', url: 'https://github.com/ShalukhoDarya/robot_framework.git'
            }
        }
        stage('Prepare') {
            steps {
                script {
                    // Установка зависимостей из requirements.txt
                    sh 'pip install -r requirements.txt'
                }
            }
        }
        stage('Run Tests on Chrome') {
            steps {
                script {
                    // Создаем директорию для результатов тестов Chrome
                    sh 'mkdir -p results/chrome'
                    // Запуск тестов Robot Framework с использованием Chrome
                    sh "robot --variable BROWSER:chrome --outputdir results/chrome ${ROBOT_TESTS_DIR}"
                }
            }
        }
        stage('Run Tests on Firefox') {
            steps {
                script {
                    // Создаем директорию для результатов тестов Firefox
                    sh 'mkdir -p results/firefox'
                    // Запуск тестов Robot Framework с использованием Firefox
                    sh "robot --variable BROWSER:firefox --outputdir results/firefox ${ROBOT_TESTS_DIR}"
                }
            }
        }
        stage('Publish Results') {
            steps {
                script {
                    // Публикация отчетов о тестах для Chrome
                    publishRobotResults(
                        outputPath: "results/chrome",
                        reportFileName: 'report.html',
                        logFileName: 'log.html',
                        reportTitle: 'Chrome Test Results'
                    )
                    // Публикация отчетов о тестах для Firefox
                    publishRobotResults(
                        outputPath: "results/firefox",
                        reportFileName: 'report.html',
                        logFileName: 'log.html',
                        reportTitle: 'Firefox Test Results'
                    )
                }
            }
        }
    }

    post {
        always {
            // Архивирование результатов тестов для Chrome
            archiveArtifacts artifacts: "results/chrome/*", allowEmptyArchive: true
            // Архивирование результатов тестов для Firefox
            archiveArtifacts artifacts: "results/firefox/*", allowEmptyArchive: true
            // Публикация HTML отчетов для Chrome
            publishHTML(target: [
                reportName : 'Chrome Robot Framework Report',
                reportDir  : "results/chrome",
                reportFiles: 'report.html',
                alwaysLinkToLastBuild: true,
                keepAll    : true
            ])
            // Публикация HTML отчетов для Firefox
            publishHTML(target: [
                reportName : 'Firefox Robot Framework Report',
                reportDir  : "results/firefox",
                reportFiles: 'report.html',
                alwaysLinkToLastBuild: true,
                keepAll    : true
            ])
        }
    }
}
