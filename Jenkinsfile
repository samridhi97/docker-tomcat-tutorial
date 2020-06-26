pipeline {
    agent any
    stages{
    def app
    stage('SCM Checkout') {
        steps{
        /* Let's make sure we have the repository cloned to our workspace */
        git 'https://github.com/samridhi97/docker-tomcat-tutorial.git'
        }}
    stage ('Build Docker Image') {
        steps{
        /* This builds the actual image; synonymous to  * docker build on the command line */
        app = docker.build("samridhi9719/mytomcat")
        }}
    stage('Test Docker Image') {
        steps{
        /* Ideally, we would run a test framework against our image. * For this example, we're using a Volkswagen-type approach ;-) */
        app.inside {
            sh 'echo "Tests passed"'
        }}
    }
    stage('Push Docker Image to Dockerhub') {
        steps{
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins * Second, the 'latest' tag. * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'dockercred') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }}
    }
}
