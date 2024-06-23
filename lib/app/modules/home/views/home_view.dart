import 'package:badazz_get_x/app/modules/home/views/widgets/bottom_sheet_ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/home_controller.dart';

enum SelectionType {
  food,
  drink;

  bool get isDrink => this == drink;
  bool get isFood => this == food;
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.clearAll();
          await showModalBottomSheet(
            context: context,
            builder: (context) => const BottomSheetUI(),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Obx(
              () {
                final isEmpty = controller.selectionList.isEmpty;

                if (isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text('Empty Data'),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.separated(
                    itemCount: controller.selectionList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final selection = controller.selectionList[index];
                      final icon = selection.selectionType.isDrink
                          ? Icons.local_cafe
                          : Icons.lunch_dining;
                      return GFListTile(
                        onTap: () async {
                          controller.controller.text = selection.name;
                          controller.selectionType.value =
                              selection.selectionType;

                          await showModalBottomSheet(
                            context: context,
                            builder: (_) => BottomSheetUI(
                              isEdit: true,
                              index: index,
                            ),
                          );
                        },
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        titleText: selection.name,
                        color: GFColors.WHITE,
                        icon: Icon(icon),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
