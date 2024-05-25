import 'package:app_ui_demo/bloc/list_bloc.dart';
import 'package:app_ui_demo/data/model/item_model.dart';
import 'package:app_ui_demo/ui/pages/add_item_page.dart';
import 'package:app_ui_demo/ui/widgets/bg_with_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<ListBloc>();
    var itemModels = bloc.state.itemModels;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              bloc.setSelectedItem(
                item: const ItemModel(),
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddItemPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle_rounded,
              size: 35,
            ),
          ),
        ],
        title: Text("Pick a list"),
        centerTitle: true,
      ),
      body: itemModels.isEmpty
          ? Center(
              child: Text("No Item Has Been Added Yet!"),
            )
          : ListView.builder(
              itemCount: itemModels.length,
              itemBuilder: (context, index) {
                var selectedItemModel = itemModels[index];
                return ItemContainer(selectedItemModel: selectedItemModel);
              },
              // children: [ItemContainer(),],
            ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.selectedItemModel,
  });

  final ItemModel selectedItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.all(16),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: BgWithPattern(
                selectedItemModel: selectedItemModel,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child:  Text(
              selectedItemModel.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
