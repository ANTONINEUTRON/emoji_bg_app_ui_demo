import 'package:app_ui_demo/bloc/list_bloc.dart';
import 'package:app_ui_demo/ui/widgets/bg_with_pattern.dart';
import 'package:app_ui_demo/ui/widgets/item_sheet_content.dart';
import 'package:app_ui_demo/ui/widgets/title_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSiz = MediaQuery.of(context).size;
    var bloc = context.watch<ListBloc>();
    var state = bloc.state;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: BgWithPattern(
              selectedItemModel: state.selectedItem!,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TitleTextField(),
                Container(
                  width: screenSiz.width,
                  height: screenSiz.height * 0.65,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: const ItemSheetContent(),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 45,
            child: CloseButton(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
