node('haimaxy-jnlp') {
    stage('Clone') {
        echo "检出源码"
        git url: "https://github.com/aijl2008/k8s-php-demo.git"
        script {
            build_tag = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
        }
    }
    stage('Test') {
      echo "执行测试"
      echo "Skipped"
    }
    stage('Build') {
        echo "构建docker镜像"
        sh "docker build -t docker.artron.net/phpinfo:${build_tag} ."
    }
    stage('Push') {
        echo "将镜像推入私有仓库"
        sh "docker push docker.artron.net/phpinfo:${build_tag}"
    }
    stage('Deploy') {
        echo "部署至kubernetes"
        def userInput = input(
            id: 'userInput',
            message: '选择部署环境',
            parameters: [
                [
                    $class: 'ChoiceParameterDefinition',
                    choices: "Dev\nTest\nProd",
                    name: 'Env'
                ]
            ]
        )
        echo "已选择: ${userInput}"
        sh "sed -i 's/<BUILD_TAG>/${build_tag}/' k8s-deployment.yaml"
        if (userInput == "Prod") {
            
        } else if (userInput == "Test"){
           
        } else {
            
        }
        sh "kubectl apply -f k8s-deployment.yaml"
    }
}
