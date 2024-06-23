import 'package:badazz_get_x/app/modules/home/selection_model.dart';
import 'package:badazz_get_x/app/modules/home/views/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';
import 'package:getwidget/getwidget.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final selectionType = SelectionType.drink.obs;

  late TextEditingController controller;
  final bottomSheetController = GFBottomSheetController();

  final selectionList = <SelectionModel>[].obs;

  void addToSelection() {
    final name = controller.text.trim();
    selectionList.add(SelectionModel(
      name: name,
      selectionType: selectionType.value,
    ));
    controller.clear();
    selectionType.value = SelectionType.drink;
  }

  void removeFromSelection(int index) {
    selectionList.removeAt(index);
  }

  void updateSelection(int index) {
    final selectionModel = SelectionModel(
      name: controller.text.trim(),
      selectionType: selectionType.value,
    );
    selectionList[index] = selectionModel;
  }

  void changeSelectionType(SelectionType type) {
    selectionType.value = type;
  }

  void clearAll() {
    controller.clear();
    selectionType.value = SelectionType.drink;
  }

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment() => count.value++;
}
