pipeline {
    agent {
        docker { image 'node:14-alpine' }
    }
    parameters { string(name: 'unauthUrl', defaultValue: 'https://example.com', description: 'targetUrl for scan') }
    stages {
        stage('Run lighthouse') { 
            steps {
                sh "npm run unauth -- --url=${unauthUrl}"
                lighthouseReport('target/report.json')
            }
        }
    }
}
