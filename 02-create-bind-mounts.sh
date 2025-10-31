#!/usr/bin/env bash

# This script must be run on the HOST, not in the dev-container.
# It creates the directory structure for our bind-mounted
# configuration files and sets the correct permissions
# to prevent "permission denied" errors in our services.

# Create the root directory
echo "--- Creating root cicd_stack directory ---"
mkdir -p ~/cicd_stack

# --- Create sub-directories and set permissions ---

# 1. Local CA (run by host user, so no chown needed)
echo "--- Creating Local CA directory ---"
mkdir -p ~/cicd_stack/ca

# 2. GitLab (runs as root internally, but config is flexible)
echo "--- Creating GitLab directory ---"
mkdir -p ~/cicd_stack/gitlab/config

# 3. Jenkins (runs as jenkins, UID 1000)
echo "--- Creating Jenkins directory (UID: 1000) ---"
mkdir -p ~/cicd_stack/jenkins/config
sudo chown -R 1000:1000 ~/cicd_stack/jenkins

# 4. Artifactory (runs as artifactory, UID 1030)
echo "--- Creating Artifactory directory (UID: 1030) ---"
mkdir -p ~/cicd_stack/artifactory/config
sudo chown -R 1030:1030 ~/cicd_stack/artifactory

# 5. SonarQube (runs as sonarqube, a non-root user, often 1000 or similar)
# We will use 1000 as a safe default.
echo "--- Creating SonarQube directory (UID: 1000) ---"
mkdir -p ~/cicd_stack/sonarqube/config
sudo chown -R 1000:1000 ~/cicd_stack/sonarqube

# 6. Mattermost (runs as mattermost, UID 1000)
echo "--- Creating Mattermost directory (UID: 1000) ---"
mkdir -p ~/cicd_stack/mattermost/config
sudo chown -R 1000:1000 ~/cicd_stack/mattermost

# 7. ELK - Logstash (runs as logstash, UID 1000)
echo "--- Creating ELK/Logstash directory (UID: 1000) ---"
mkdir -p ~/cicd_stack/elk/logstash
sudo chown -R 1000:1000 ~/cicd_stack/elk/logstash

# 8. Prometheus (runs as nobody, UID 65534)
echo "--- Creating Prometheus directory (UID: 65534) ---"
mkdir -p ~/cicd_stack/prometheus/config
sudo chown -R 65534:65534 ~/cicd_stack/prometheus

# 9. Grafana (runs as grafana, UID 472)
echo "--- Creating Grafana directory (UID: 472) ---"
mkdir -p ~/cicd_stack/grafana/config
sudo chown -R 472:472 ~/cicd_stack/grafana

echo "--- Directory structure created successfully ---"
ls -ld ~/cicd_stack/*/