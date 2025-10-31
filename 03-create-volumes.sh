#!/usr/bin/env bash

# This script creates all the Docker-managed volumes
# needed for our CI/CD stack.
# By creating them manually *before* we launch services,
# we decouple the data's lifecycle from the container's
# lifecycle, protecting it from accidental deletion.

echo "--- Creating persistent volumes for CI/CD stack ---"

# GitLab
docker volume create gitlab-data
docker volume create gitlab-logs

# Jenkins
docker volume create jenkins-home

# Artifactory
docker volume create artifactory-data

# SonarQube
docker volume create sonarqube-data
docker volume create sonarqube-extensions

# Mattermost
docker volume create mattermost-data

# ELK Stack
docker volume create elasticsearch-data

# Prometheus & Grafana
# Note: Prometheus data is often considered ephemeral,
# but we will persist it.
docker volume create grafana-data

echo "--- Volume creation complete ---"
docker volume ls