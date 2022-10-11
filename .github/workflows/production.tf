# Terraform Provider release workflow.
name: deploy to production

on:
  push:
    tags:
    - 'prod-*'