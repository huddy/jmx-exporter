node() { 
        git url: "https://github.com/huddy/jmx-exporter"
 
        stage "build"
        sh 'docker build .'
        
        stage "get commit id"
        sh "git rev-parse --short HEAD > .git/commit-id"                        
        commit_id = readFile('.git/commit-id')
    
        stage "print commit id"
        echo env.commit_id
}


