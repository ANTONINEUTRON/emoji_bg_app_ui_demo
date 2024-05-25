import 'package:app_ui_demo/bloc/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        maxLines: 1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
        ),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Title",
        ),
        onChanged: (value) {
          context.read<ListBloc>().setSelectedItemTitle(value);
        },
      ),
    );
  }
}
