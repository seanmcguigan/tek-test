# Terraform Provider release workflow.
name: deploy to staging

on:
  push:
    tags:
    - 'staging-*'