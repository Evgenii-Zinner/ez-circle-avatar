import 'package:flutter/material.dart';

/// A widget that displays a circular avatar with initials or an icon.
///
/// The avatar can display initials derived from a name, a custom child,
/// a background image, or a foreground image. It also supports custom
/// background and foreground colors, as well as custom radius.
class EzCircleAvatar extends StatelessWidget {
  const EzCircleAvatar({
    super.key,
    required this.name,
    this.backgroundColor,
    this.foregroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.child,
    this.radius,
    this.maxRadius,
    this.minRadius,
    this.onBackgroundImageError,
    this.onForegroundImageError,
  });

  /// The name of the avatar, used to generate initials and a default background color.
  final String name;

  /// The background color of the circle.
  final Color? backgroundColor;

  /// The color to use for text in the circle (if no image is provided).
  final Color? foregroundColor;

  /// The child of the circle.
  final Widget? child;

  /// The radius of the circle.
  final double? radius;

  /// The maximum radius of the circle.
  final double? maxRadius;

  /// The minimum radius of the circle.
  final double? minRadius;

  /// The background image of the circle.
  final ImageProvider<Object>? backgroundImage;

  /// The foreground image of the circle.
  final ImageProvider<Object>? foregroundImage;

  /// Called when an error occurs loading the background image.
  final ImageErrorListener? onBackgroundImageError;

  /// Called when an error occurs loading the foreground image.
  final ImageErrorListener? onForegroundImageError;

  @override
  Widget build(BuildContext context) {
    final initials = _EzAvatarHelper.getInitials(name);
    final bgColor = backgroundColor ?? _EzAvatarHelper.stringToColor(name);
    final fgColor =
        foregroundColor ?? _EzAvatarHelper.getContrastingColor(bgColor);
    return CircleAvatar(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        radius: radius,
        maxRadius: maxRadius,
        minRadius: minRadius,
        backgroundImage: backgroundImage,
        foregroundImage: foregroundImage,
        onBackgroundImageError: onBackgroundImageError,
        onForegroundImageError: onForegroundImageError,
        child: child ??
            (initials.isEmpty ? _EzAvatarHelper.defaultIcon : Text(initials)));
  }
}

class _EzAvatarHelper {
  static const defaultIcon = Icon(Icons.person_outline);

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

  static Color getContrastingColor(Color color) {
    final brightness = ThemeData.estimateBrightnessForColor(color);
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

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
