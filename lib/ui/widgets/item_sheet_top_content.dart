import 'package:app_ui_demo/bloc/list_bloc.dart';
import 'package:app_ui_demo/data/model/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemSheetTopContent extends StatelessWidget {
  const ItemSheetTopContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var headerTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    var bloc = context.watch<ListBloc>();
    var state = bloc.state;

    var theme = ThemeColors.values;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Background",
          style: headerTextStyle,
        ),
        const Text("Decorate your text with matching emojis"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: TextField(
            onChanged: (value) {
              bloc.setSelectedItemBgText(value);
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey.shade200,
              filled: true,
            ),
          ),
        ),
        Text(
          "Color",
          style: headerTextStyle,
        ),
        const Text("Pick an accent color"),
        GridView.builder(
          shrinkWrap: true,
          itemCount: theme.length,
          padding: EdgeInsets.symmetric(vertical: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            var currentTheme = theme[index];
            return GestureDetector(
              onTap: () {
                bloc.setSelectedItemTheme(currentTheme);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(currentTheme.colorValue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: state.selectedItem?.colors == currentTheme
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : null,
              ),
            );
          },
        )
      ],
    );
  }
}
