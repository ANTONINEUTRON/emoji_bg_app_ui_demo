import 'package:app_ui_demo/data/model/theme_colors.dart';
import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  const ItemModel({
    this.bgEmojis = "",
    this.title = "",
    this.colors = ThemeColors.blue,
  });

  final String bgEmojis;
  final String title;
  final ThemeColors colors;

  @override
  List<Object?> get props => [
        bgEmojis,
        title,
        colors,
      ];

  ItemModel copyWith({
    String? bgEmojis,
    String? title,
    ThemeColors? colors,
  }) =>
      ItemModel(
        bgEmojis: bgEmojis ?? this.bgEmojis,
        title: title ?? this.title,
        colors: colors ?? this.colors,
      );
}
