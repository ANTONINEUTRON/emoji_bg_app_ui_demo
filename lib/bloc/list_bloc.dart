import 'package:app_ui_demo/bloc/list_state.dart';
import 'package:app_ui_demo/data/model/item_model.dart';
import 'package:app_ui_demo/data/model/theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Cubit<ListState> {
  ListBloc() : super(const ListState());

  void setSelectedItem({required ItemModel item}) => emit(
        state.copyWith(
          selectedItem: item,
        ),
      );

  void setSelectedItemTitle(String title) => emit(
        state.copyWith(
          selectedItem: state.selectedItem!.copyWith(title: title),
        ),
      );

  void setSelectedItemTheme(ThemeColors theme) => emit(
        state.copyWith(
          selectedItem: state.selectedItem!.copyWith(colors: theme),
        ),
      );

  void setSelectedItemBgText(String bgText) => emit(
        state.copyWith(
          selectedItem: state.selectedItem!.copyWith(bgEmojis: bgText),
        ),
      );

  void saveSelectedItem() async {
    if (state.selectedItem!.title.isNotEmpty) {
      emit(
        state.copyWith(
          itemModels: [
            ...state.itemModels,
            state.selectedItem!,
          ],
        ),
      );
    }
  }
}
