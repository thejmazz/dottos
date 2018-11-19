local registry = 'registry.jmazz.ca';

local build = import './tmux/build.step.libsonnet';

{
  kind: 'Pipeline',
  steps: [
    build.step(
      registry=registry,
      repo='tmux',
      tag='2.8',
    ),
    build.step(
      registry=registry,
      repo='neovim',
      tag='v0.3.1'
    ),
    // TODO include build args object, so tmux 2.8 can be passed
    build.step(
      registry=registry,
      repo='console',
      tag='latest'
    ),
  ],
  volumes: [{
    name: 'docker',
    host: {
      path: '/var/run/docker.sock',
    },
  }],
}
