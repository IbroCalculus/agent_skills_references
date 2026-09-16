# DCli Commands & Methods Cheat Sheet

## CLI Commands

```bash
# 1. Install DCli globally
dart pub global activate dcli

# 2. Run DCli doctor / environment check
dcli doctor

# 3. Compile a script into an AOT binary (Windows .exe, Linux, macOS)
dcli compile my_script.dart
```

---

## File System Functions

- `exists(path)`: Checks if file or directory exists.
- `touch(path, create: true)`: Creates empty file or updates timestamp.
- `read(path).toList()`: Reads all lines of a file into a list.
- `cat(path)`: Prints contents to stdout.
- `replace(path, target, replacement)`: In-place string replacement in a file.
