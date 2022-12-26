# flutter-build-runner-action

Runs the [Flutter / Dart Build Runner](https://pub.dev/packages/build_runner) via `flutter pub run build_runner build` and caches the results so subsequent runs are faster.

## Usage

This runner does not figure out which files are used by the build_runners. By default the filepaths and contents of all the dart files, pubspec and proto files are used to build the cache key. You can configure which files should be used.

```yaml
steps:
  - name: Flutter Build Runner
    uses: vhanda/flutter-build-runner-action@v1
    with:
      output_paths: |
        lib/generated/
        lib/**/*.g.dart
```

Custom File List -

```yaml
steps:
  - name: Flutter Build Runner
    uses: vhanda/flutter-build-runner-action@v1
    with:
      input_paths: "**/*.dart pubspec.* **/*.proto **/*.custom"
      output_paths: |
        lib/generated/
        lib/**/*.g.dart
```
