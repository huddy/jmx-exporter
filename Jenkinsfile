node() { 
        git url: "https://github.com/huddy/jmx-exporter"
 
        stage "get commit id"
        sh "git rev-parse --short HEAD > .git/commit-id"                        
        commit_id = readFile('.git/commit-id')
        echo "${commit_id}"
        
        stage "build"
        script { 
          image = docker.build("jmx-exporter")
        }
        
        stage "tag"
        sh "docker tag jmx-exporter gcr.io/sphonic-merchantportal/jmx-exporter:${commit_id}"
        
        stage "push to docker registry"
        sh "gcloud --project=sphonic-merchantportal docker -- push gcr.io/sphonic-merchantportal/jmx-exporter:${commit_id}"
        
}


