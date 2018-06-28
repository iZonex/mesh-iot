node('master') {
    stage('Checkout') {
        checkout scm
    }
    // stage('Dockerfile Check') {
    //     sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    // }
    stage('Setup environment') {
        def dockerImage = docker.build("mesh-iot/yocto:${env.BUILD_ID}")
    }
    stage('Clone project') {
        def dockerImage = docker.image("mesh-iot/yocto:${env.BUILD_ID}")
        dockerImage.inside {
            sh 'repo init -u https://github.com/iZonex/mesh-iot-manifest.git'
            sh 'repo sync'
        }
    }
    stage('Build project') {
        def dockerImage = docker.image("mesh-iot/yocto:${env.BUILD_ID}")
        dockerImage.inside {
            sh 'echo ls -lah'
        }
    }
    // stage('Build Production') {
    //     echo 'Building..'
    // }
}