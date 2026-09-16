# Melos Commands & Operations Guide

## Common Commands

```bash
# 1. Install Melos globally
dart pub global activate melos

# 2. Link all local packages and resolve dependencies
melos bootstrap (or melos bs)

# 3. Clean all build caches and pub caches across all packages
melos clean

# 4. Run static analysis across every package in parallel
melos run analyze

# 5. Run test suites across every package
melos run test

# 6. Automatic versioning & changelog generation
melos version --yes
```

---

## Filtering Commands

Target specific packages or directories:

```bash
# Run command only on Flutter packages
melos exec --dir-exists="android" -- flutter test

# Run command only on packages matching a glob
melos exec --scope="*models*" -- dart analyze
```
