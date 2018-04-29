In April 2018 we started to experiment more seriously with GitLab and GitLab CI.

= GitLab CI =
Support for GitLab CI was added in https://trac.sagemath.org/ticket/24655.

== Free Runners with Google Compute Engine ==
Currently, Google gives everybody who signs up $300 of credit for 12 months. They won't charge you unless you explicitly upgrade, and there are a few limitations (e.g, at most 8 CPUs per regions.) Btw., they don't charge you if you upgrade unless you run out of the free credit.

 1. Sign up at cloud.google.com (you might want to use an account that you don't use for anything else on cloud.google.com, so your quotas do not interfere with what we are doing here…)
 1. Go to "Compute Engine" → "VM Instance" → "Create Instance".
   * Name, e.g., "gitlabci-orchestrator"
   * Zone "us-east1-b" (so you can follow exactly this guide later)
   * Machine Type "micro"
   * Boot Disk "Ubuntu 18.04 LTS"
   * Keep Defaults for everything else, and click "Create"
 1. Wait for your machine to boot and click the "SSH" button to connect.
   * sudo su
   * apt-get update
   * 
