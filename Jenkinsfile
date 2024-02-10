pipeline {
    agent any

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'dock_images')
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description: "name of the Application", defaultValue: 'manojvaddi497')
    }

    stages {
        stage('Git Checkout') {
                    when { expression { params.action == 'create'} }
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name:  'main' ]],
                    userRemoteConfigs: [[ url: 'https://github.com/manojvaddi97/django.git' ]]
                ])
            }
        }
        
        stage('Build Docker Image') {
                     when { expression { params.action == 'create'} }
            steps {
                sh """
                 docker image build -t ${DockerHubUser}/${ImageName}:latest .
                """
                }
            }
        }
        
    }