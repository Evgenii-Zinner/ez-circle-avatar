import 'package:flutter/material.dart';

class EzCircleAvatar extends StatelessWidget {
  final String name;

  const EzCircleAvatar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final initials = EzAvatarHelper.getInitials(name);
    return CircleAvatar(
      backgroundColor: EzAvatarHelper.stringToColor(name),
      child: initials.isEmpty ? EzAvatarHelper.defaultIcon : Text(initials),
    );
  }
}

class EzAvatarHelper {
  /// The default icon to use when no initials are available.
  ///
  /// This is used in [EzCircleAvatar] when the input name is empty or null.
  static const defaultIcon = Icon(Icons.person_outline);

  /// Converts a string to a color using a hash function.
  ///
  /// This method generates a color based on the input string's hash code.
  static Color stringToColor(String str) {
    int hash = 0;
    for (int i = 0; i < str.length; i++) {
      hash = str.codeUnitAt(i) + ((hash << 5) - hash);
    }
    final r = (hash & 0xFF0000) >> 16;
    final g = (hash & 0x00FF00) >> 8;
    final b = hash & 0x0000FF;
    final hslColor = HSLColor.fromColor(Color.fromRGBO(r, g, b, 1));
    final newHslColor = hslColor.withLightness((hslColor.lightness + 1.0) / 2);
    return newHslColor.toColor();
  }

  /// Extracts the initials from a given name.
  ///
  /// This method takes a name string and returns the initials.
  /// - If the name is empty, it returns an empty string.
  /// - If the name has one word, it returns the first letter in uppercase.
  /// - If the name has multiple words, it returns the first letter of the first
  ///   and last words in uppercase.
  static String getInitials(String name) {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      return '';
    }
    final names = trimmedName.split(' ');
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    } else {
      return '${names[0][0]}${names[names.length - 1][0]}'.toUpperCase();
    }
  }
}
