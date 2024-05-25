import 'package:app_ui_demo/bloc/list_bloc.dart';
import 'package:app_ui_demo/ui/widgets/item_sheet_top_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemSheetContent extends StatelessWidget {
  const ItemSheetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ItemSheetTopContent(),
          ElevatedButton.icon(
            onPressed: () {
              context.read<ListBloc>().saveSelectedItem();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
            ),
            icon: Icon(Icons.check),
            label: Text("Create list"),
          )
        ],
      ),
    );
  }
}
