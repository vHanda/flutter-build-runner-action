# flutter-build-runner-action

Runs the [Flutter / Dart Build Runner](https://pub.dev/packages/build_runner) and caches the results so subsequent runs are faster.

## Usage

```yaml
steps:
  - name: Flutter Build Runner
    uses: vhanda/flutter-build-runner-action@v1
    with:
      output_paths: |
        lib/generated/
        lib/**/*.g.dart
```

The cache key is based on the sha1 commit hash. This means that **the cache will only be shared among different jobs for the same commit**.

## Sharing Caches Between Commits

**tldr: Not worth it**

Most build_runners operate by reading all the dart files. We could potentially avoid regenerating the built files by only monitoring those files, but I would prefer the default behavior to always just work. There will be edge cases of people getting stuck because of runners which operate on non-dart files. I've experimented with allowing a custom glob pattern for when the cache should be rebuilt, but one would have to remember to update it.

This all seems ripe for possible error cases, for very little gain. Cache invalidation is supposed to be one of those hard computer science problems.

Additionally build_runners doesn't provide a way for runners to output exactly what files they are interested in. Just glob patterns. I've looked into the code, and changing this behavior is going to be a lot of work, for very little gain.
