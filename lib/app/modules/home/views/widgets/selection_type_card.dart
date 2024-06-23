import 'package:badazz_get_x/app/modules/home/controllers/home_controller.dart';
import 'package:badazz_get_x/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/colors/gf_color.dart';

class SelectionTypeCard extends GetView<HomeController> {
  const SelectionTypeCard({
    required this.selectionType,
    required this.icon,
    super.key,
  });

  final SelectionType selectionType;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final stateSelectionType = controller.selectionType;
      final isSelected = stateSelectionType.value == selectionType;
      final color = isSelected ? GFColors.ALT : GFColors.DARK.withOpacity(.2);
      return Expanded(
        child: GestureDetector(
          onTap: () => controller.changeSelectionType(selectionType),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(6),
            ),
            height: 80,
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: GFColors.PRIMARY),
                Text(selectionType.name),
              ],
            ),
          ),
        ),
      );
    });
  }
}
