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
        lib/*.g.dart
```

By default the cache key is based on the sha1 commit hash. This means that the cache will only be shared among different jobs for the same commit.
