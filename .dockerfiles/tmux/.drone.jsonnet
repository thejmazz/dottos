local registry = 'registry.jmazz.ca';

local build = import 'build.step.libsonnet';

{
  kind: 'Pipeline',
  steps: [
    build.step(
      registry=registry,
      repo='tmux',
      tag='2.8',
      dir='.'
    ),
  ],
  volumes: [{
    name: 'docker',
    host: {
      path: '/var/run/docker.sock',
    },
  }],
}
