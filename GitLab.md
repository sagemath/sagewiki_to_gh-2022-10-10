In April 2018 we started to experiment more seriously with GitLab and GitLab CI.

= GitLab CI =
Support for GitLab CI was added in https://trac.sagemath.org/ticket/24655.

== Free Runners with Google Compute Engine ==
Currently, Google gives everybody who signs up $300 of credit for 12 months. They won't charge you unless you explicitly upgrade, and there are a few limitations (e.g, at most 8 CPUs per regions.) Btw., they don't charge you if you upgrade unless you run out of the free credit.

 1. Sign up at cloud.google.com (you might want to use an account that you don't use for anything else on cloud.google.com, so your quotas do not interfere with what we are doing here…)
 1. Create a new project (click on "My first project", then "+".)
 1. Go to "Compute Engine" → "VM Instance" → "Create Instance".
   * Name, e.g., "gitlabci-orchestrator"
   * Zone "us-east1-b"
   * Machine Type "micro"
   * Boot Disk "Debian 9 stretch"
   * Keep Defaults for everything else, and click "Create"
 1. Wait for your machine to boot and click the "SSH" button to connect.
{{{
   * sudo su
   * apt-get update
   * sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
   * curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash
   * curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
   * add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
   * apt-get update
   * apt-get install -y gitlab-runner docker-ce
   * base=https://github.com/docker/machine/releases/download/v0.14.0
   * curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
   * install /tmp/docker-machine /usr/local/bin/docker-machine
   * REGIONS="us-east4-c us-central1-c us-west1-c europe-west4-c europe-west1-c europe-west2-c europe-west3-c asia-east1-c asia-southeast1-a asia-northeast1-c asia-south1-c australia-southeast1-c" # for a maximum of 12*8+2 CPUs
   * export REGISTRATION_TOKEN=TX-uvssj6AeA1xthsqSH
   * NAME=gce-jrueth # a *short* name that contains gce and your username (and only lowercase characters and hyphens)
   * export REGISTER_LOCKED=false
   * PROJECT=tidy-scholar-202621 # the name of the google cloud project (click no "My First Project" to find out)
   * for region in $REGIONS;do gitlab-runner register --tag-list do,standard-4 --run-untagged --name $NAME-$region --limit 2 --executor docker+machine --env "DOCKER_DRIVER=overlay2" --docker-privileged --url https://gitlab.com --non-interactive --docker-image docker:latest --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" --docker-volumes "/dev/urandom:/dev/random" --docker-shm-size 2147483648 --machine-machine-driver google --machine-idle-time 600 --machine-machine-name "$NAME-%s" --machine-machine-options "google-project=$PROJECT","google-machine-type=n1-standard-4","google-machine-image=coreos-cloud/global/images/family/coreos-stable","google-tags=gitlab-ci-slave","google-preemptible=true","google-zone=$region","google-use-internal-ip=true","google-disk-type=pd-standard","google-disk-size=64"; done
   * vim /etc/gitlab-runner/config.toml
   * replace concurrent=1 with concurrent=99
   * systemctl restart gitlab-runner
   * exit
   * exit
}}}
TODO: There is some room for improvement here. These instances do not support caches (we do not use caching currently) and they always pull the sagemath-dev images from the registry which incurs quite a bit of ingress cost.
