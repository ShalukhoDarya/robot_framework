pipeline {
    agent any

    environment {
        // Define the virtual environment directory
        VENV = 'venv'
        // Define the directory where Robot Framework tests are located
        ROBOT_TESTS_DIR = 'tests'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the correct branch from the specified Git repository
                git branch: 'main', url: 'https://github.com/ShalukhoDarya/robot_framework.git'
            }
        }

        stage('Setup Environment') {
            steps {
                script {
                    // Create a virtual environment if it doesn't exist
                    sh "python -m venv --clear ${VENV}"
                    // Activate the virtual environment
                    sh ". ${VENV}/bin/activate"
                    // Upgrade pip to the latest version
                    sh "pip install --upgrade pip"
                    // Install Robot Framework and SeleniumLibrary
                    sh "pip install robotframework robotframework-seleniumlibrary"
                }
            }
        }

        stage('Run Tests on Chrome') {
            steps {
                script {
                    // Activate the virtual environment
                    sh ". ${VENV}/bin/activate"
                    // Run Robot Framework tests with Chrome
                    sh "robot --variable BROWSER:Chrome -d results/chrome ${ROBOT_TESTS_DIR}/"
                }
            }
            post {
                always {
                    // Archive the test results
                    archiveArtifacts artifacts: 'results/chrome/*.xml', allowEmptyArchive: true
                    // Publish the Robot Framework test report
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

        stage('Run Tests on Firefox') {
            steps {
                script {
                    // Activate the virtual environment
                    sh ". ${VENV}/bin/activate"
                    // Run Robot Framework tests with Firefox
                    sh "robot --variable BROWSER:Firefox -d results/firefox ${ROBOT_TESTS_DIR}/"
                }
            }
            post {
                always {
                    // Archive the test results
                    archiveArtifacts artifacts: 'results/firefox/*.xml', allowEmptyArchive: true
                    // Publish the Robot Framework test report
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
            // Clean up the virtual environment after the build
            cleanWs()
        }
    }
}