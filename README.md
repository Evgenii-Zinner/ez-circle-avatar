# ez_circle_avatar

A simple Flutter widget for displaying circular avatars with initials, a consistent, automatically generated background color, and a contrasting foreground color.

![Showcase of ez_circle_avatar](https://raw.githubusercontent.com/Evgenii-Zinner/ez-circle-avatar/main/images/ez_circle_avatar_showcase.png)

## ✨ Features

*   **Automatic Colors:** Generates a consistent background color from a name and automatically selects a contrasting foreground (black or white) for readability.
*   **Name-Based Initials:** Creates initials from a given name (handles single, first/last, and multiple names).
*   **Highly Customizable:** Override colors, display images, or provide a custom child widget.
*   **Easy to Use:** Just provide a name to get a complete avatar.
*   **Default Icon:** Displays a `person_outline` icon when the name is empty.

## 📦 Installation

Run this command in your terminal:

```shell
flutter pub add ez_circle_avatar
```

## 🚀 Usage

Import the package and use the `EzCircleAvatar` widget.

```dart
import 'package:flutter/material.dart';
import 'package:ez_circle_avatar/ez_circle_avatar.dart';

class AvatarShowcaseScreen extends StatelessWidget {
  const AvatarShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EzCircleAvatar Demo')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Basic usage
            EzCircleAvatar(name: 'Jane Doe'),
            SizedBox(height: 16),

            // Custom radius and colors
            EzCircleAvatar(
              name: 'John',
              radius: 40,
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            SizedBox(height: 16),

            // With a background image
            EzCircleAvatar(
              name: 'John David Doe',
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎨 Customization

Customize the avatar by passing any of the following properties:

| Property                 | Description                                                               |
| ------------------------ | ------------------------------------------------------------------------- |
| `name`                   | The string used to generate initials and the default background color.    |
| `backgroundColor`        | Overrides the automatically generated background color.                   |
| `foregroundColor`        | Overrides the automatically selected contrasting text color.              |
| `radius`                 | The radius of the circular avatar.                                        |
| `backgroundImage`        | An `ImageProvider` for the background of the avatar.                      |
| `foregroundImage`        | An `ImageProvider` for the foreground of the avatar.                      |
| `child`                  | A custom widget to display inside the circle, replacing the initials.     |
| `onBackgroundImageError` | A callback for handling errors when loading the background image.         |
| `onForegroundImageError` | A callback for handling errors when loading the foreground image.         |

## 🤝 Contributing

Contributions are welcome! If you have a feature request, bug report, or want to contribute to the code, please feel free to open an issue or submit a pull request on the [GitHub repository](https://github.com/Evgenii-Zinner/ez-circle-avatar).

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
