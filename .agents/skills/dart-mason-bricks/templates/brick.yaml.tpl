name: feature_brick
description: Generates a Clean Architecture feature slice.
version: 0.1.0+1
environment:
  mason: '>=0.1.0-dev.50 <0.1.0'

vars:
  name:
    type: string
    description: The feature name
    default: my_feature
    prompt: What is the feature name?
  has_repository:
    type: boolean
    description: Include a dedicated repository layer?
    default: true
