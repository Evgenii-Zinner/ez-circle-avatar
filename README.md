# EZ Circle Avatar

A **defensive, consistent, and customizable** Flutter avatar widget designed to simplify user profile displays.

## 🛑 The Problem

Displaying user avatars often involves repetitive boilerplate:
1.  **Inconsistent Colors:** Generating a background color from a name usually requires custom logic that might differ between screens, leading to a jarring user experience where "John" is red on one screen and blue on another.
2.  **Initials Extraction:** extracting "JD" from "John Doe" (or handling single names, empty strings, etc.) is tedious to rewrite.
3.  **Contrast Issues:** Ensuring text is readable against a generated background color is often overlooked.

## ✅ The EZ Solution

`EzCircleAvatar` solves these problems automatically:
-   **Consistent Hashing:** Uses a deterministic hash of the `name` to generate the **same background color** everywhere in your app. "John" will always be the same shade of teal, ensuring UI consistency.
-   **Smart Initials:** Automatically extracts initials (e.g., "John Doe" -> "JD", "Alice" -> "A").
-   **Automatic Contrast:** intelligently selects a foreground color (black or white) based on the background luminance for perfect readability.
-   **Defensive Design:** Handles empty names, null images, and loading errors gracefully.

## ✨ Features

*   **Deterministic Color Generation:** The same name always produces the same color.
*   **Automatic Initials:** Handles first/last names, single names, and edge cases.
*   **Readable Text:** Auto-calculates contrast for foreground text.
*   **Highly Customizable:** Override colors, radius, images, or child widgets easily.
*   **Fallback Support:** Shows a default icon if no name or image is provided.

## 📦 Installation

```shell
flutter pub add ez_circle_avatar
```

## 🚀 Usage

### Basic (Consistent Color & Initials)
Result: A circle with "JD" and a consistent background color derived from "Jane Doe".
```dart
EzCircleAvatar(name: 'Jane Doe')
```

### With Image (Graceful Loading)
Shows the image. If it fails to load, falls back to initials "JS" on a colored background.
```dart
EzCircleAvatar(
  name: 'John Smith',
  backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
)
```

### Custom Styling
Override generated color or contrast.
```dart
EzCircleAvatar(
  name: 'Admin User',
  radius: 40,
  backgroundColor: Colors.black,
  foregroundColor: Colors.amber,
)
```

## 🤝 Contributing

Contributions are welcome! Please feel free to open an issue or submit a pull request on [GitHub](https://github.com/Evgenii-Zinner/ez_circle_avatar).

## 📜 License

MIT License - see the [LICENSE](LICENSE) file for details.
