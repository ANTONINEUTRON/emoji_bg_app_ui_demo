import 'package:app_ui_demo/data/model/item_model.dart';
import 'package:equatable/equatable.dart';

class ListState extends Equatable {
  const ListState({
    this.itemModels = const [],
    this.selectedItem,
  });

  final List<ItemModel> itemModels;
  final ItemModel? selectedItem;

  @override
  List<Object?> get props => [
        itemModels,
        selectedItem,
      ];

  ListState copyWith({
    List<ItemModel>? itemModels,
    ItemModel? selectedItem,
  }) {
    return ListState(
      itemModels: itemModels ?? this.itemModels,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }
}
