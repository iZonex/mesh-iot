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
            sh 'git config --global user.email yocto@jenkins.local'
            sh 'git config --global user.name yocto'
            sh 'repo init -u https://github.com/iZonex/mesh-iot-manifest.git'
            sh 'repo sync'
        }
    }
    stage('Build project') {
        def dockerImage = docker.image("mesh-iot/yocto:${env.BUILD_ID}")
        dockerImage.inside {
            sh 'cd poky && /bin/bash -c "source oe-init-build-env build && bitbake core-image-minimal"'
        }
    }
    // stage('Build Production') {
    //     echo 'Building..'
    // }
}