# Mason Mustache Variable Syntax & Modifiers

## String Case Modifiers

Given variable `name: "userProfile"`:

| Modifier | Output |
| :--- | :--- |
| `{{name.camelCase()}}` | `userProfile` |
| `{{name.pascalCase()}}` | `UserProfile` |
| `{{name.snakeCase()}}` | `user_profile` |
| `{{name.paramCase()}}` | `user-profile` |
| `{{name.constantCase()}}` | `USER_PROFILE` |

---

## Conditionals & Loops

```mustache
{{#isStateful}}
class {{name.pascalCase()}}Screen extends StatefulWidget {
  const {{name.pascalCase()}}Screen({super.key});
}
{{/isStateful}}
{{^isStateful}}
class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});
}
{{/isStateful}}
```
