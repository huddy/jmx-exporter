node() { 
        git url: "ssh://git@phabricator.sphoniclabs.net/diffusion/62/jmx-exporter-docker.git"
  
        def commit_id
        def registry = "gcr.io"
        def project = "sphonic-merchantportal"
        def name = "jmx-exporter" 

        sh "git rev-parse --short HEAD > .git/commit-id"                        
        commit_id = readFile('.git/commit-id')
    
        tag = "${registry}/${project}/${name}:${commit_id}"
        
        stage "Build"
        script { 
          image = docker.build("jmx-exporter")
        }
  
        stage "Tag"
        sh "docker tag jmx-exporter ${tag}" 
        
        stage "Push"
        sh "gcloud --project=sphonic-merchantportal docker -- push $tag"
}
