{
  // TODO accept build args
  // TODO skip option, if present in registry
  // TODO push option, or another step?
  // TODO "auto-workspace" into folder?
  step(registry, repo, tag, dir=repo)::
    {
      name: std.join('-', ['build', registry, repo, tag]),
      image: 'docker:18.06',
      volumes: [{
        name: 'docker',
        path: '/var/run/docker.sock',
      }],
      environment: {
        REGISTRY: registry,
        REPO: repo,
        TAG: tag,
      },
      commands: [
        // 'IMAGE=$REGISTRY/$REPO:$TAG',
        'IMAGE=local-$REPO:$TAG',
        'echo $IMAGE',
        'cd ' + dir,
        'cat Dockerfile',
        'docker build -t $IMAGE .',
      ],
    },
}
