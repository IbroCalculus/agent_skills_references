name: my_monorepo
repository: https://github.com/my_org/my_monorepo

packages:
  - 'packages/**'
  - 'apps/**'

command:
  version:
    generateCommit: true
    linkToCommits: true
    branch: main

scripts:
  analyze:
    run: melos exec -- dart analyze .
    description: Run Dart static analyzer in all packages.

  test:
    run: melos exec --dir-exists="test" -- fail-fast -- flutter test
    description: Run test suites across all packages.

  build_runner:
    run: melos exec --depends-on="build_runner" -- dart run build_runner build --delete-conflicting-outputs
    description: Run build_runner code generation across all packages.
