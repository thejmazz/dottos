local registry = 'registry.jmazz.ca';
local repo = 'console';
local tag = 'latest';

{
  kind: 'Pipeline',
  steps: [{
    name: 'build',
    image: 'docker:18.06',
    volumes: [{
      name: 'docker',
      path: '/var/lib/docker',
    }],
    environment: {
      REGISTRY: registry,
      REPO: repo,
      Tag: tag,
    },
    commands: [
      'IMAGE=$REGISTRY/$REPO:$TAG',
      'echo $IMAGE',
      'cat Dockerfile',
      'docker build -t $IMAGE .',
    ],
  }],
  volumes: [{
    name: 'docker',
    path: '/var/lib/docker',
  }],
}
