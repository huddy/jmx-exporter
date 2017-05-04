node() { 
        git url: "https://github.com/huddy/jmx-exporter"
 
        stage "get commit id"
        sh "git rev-parse --short HEAD > .git/commit-id"                        
        commit_id = readFile('.git/commit-id')
        echo "${commit_id}"
        
        stage "build"
        sh 'docker build -t jmx-exporter:${commit_id} .'
        sh "docker images -a | grep jmx"
        echo "${commit_id}"        
 
}


