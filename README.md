# ez_circle_avatar

A simple Flutter widget for displaying circular avatars with initials and a consistent, 
automatically generated background color based on a name.  
Perfect for quick integration when you need a basic avatar without extensive customization.

## Features

*   **Name-Based Initials & Consistent Colors:** Generates initials and a consistent background color from a given name (handles single, first/last, and multiple names).  The same name always produces the same color.
*   **Easy to Use:** Just provide the name.
*   **Default Icon:** Displays a `person_outline` icon when no name is provided.
*   **Handles Name Variations:** Trims leading/trailing spaces in names.
*   **Customizable:** Uses the standard Flutter `CircleAvatar` widget, allowing further customization (size, border, etc.).
*   **Available on pub.dev:** [ez_circle_avatar](https://pub.dev/packages/ez_circle_avatar)

## Getting started

1.  Add the dependency:

    ```bash
    flutter pub add ez_circle_avatar
    ```

2.  Import the package:

    ```dart
    import 'package:ez_circle_avatar/ez_circle_avatar.dart';
    ```

## Usage

Displaying a basic avatar is as simple as this:

```dart
EzCircleAvatar(name: 'Jane Doe') // Different name, different color
EzCircleAvatar(name: 'John')      // Handles single names
EzCircleAvatar(name: 'John David Doe') // Handles multiple names
EzCircleAvatar(name: '') // Handles empty name, will show a person_outline icon
EzCircleAvatar(name: 'Jane Doe',radius: 24,)
EzCircleAvatar(name: 'John', backgroundColor: Colors.deepPurple)
EzCircleAvatar(name: 'John David Doe',backgroundImage: AssetImage('images/image.png'))
EzCircleAvatar(name: '', child: Icon(Icons.person, color: Colors.white, size: 20)),)
```

And the result will be like this:

![Showcase of ez_circle_avatar](https://github.com/Evgenii-Zinner/ez-circle-avatar/blob/63353fe9b559bf4e7f63f8566c838fe442c58295/images/ez_circle_avatar_showcase.png)

## Maintainer

*   [Evgenii Zinner](https://github.com/Evgenii-Zinner)

## Contributing

Contributions are welcome! Please feel free to open issues and submit pull requests.

## License

[MIT](LICENSE)