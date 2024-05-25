enum ThemeColors {
  blue(colorValue:0xFF2196F3 ),
  orange(colorValue: 0xFFEF6C00),
  red(colorValue:0xFFF44336),
  green(colorValue: 0xFF4CAF50),
  purple(colorValue: 0xFF9C27B0),
  teal(colorValue: 0xFF008080);

  const ThemeColors({required this.colorValue});
  final int colorValue;
}
