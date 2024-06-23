import 'package:badazz_get_x/app/modules/home/controllers/home_controller.dart';
import 'package:badazz_get_x/app/modules/home/views/home_view.dart';
import 'package:badazz_get_x/app/modules/home/views/widgets/selection_type_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/getwidget.dart';

class BottomSheetUI extends GetView<HomeController> {
  const BottomSheetUI({this.index, this.isEdit = false, super.key});

  final bool isEdit;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: GFColors.WHITE,
      ),
      height: isEdit ? 380 : 330,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GFTypography(
            text: 'Create Selection Food/Drink',
            type: GFTypographyType.typo3,
            showDivider: false,
          ),
          const SizedBox(height: 10),
          GFTextFieldRounded(
            maxLines: 1,
            cornerradius: 4,
            borderwidth: 0.0,
            marginhorizontal: 0.0,
            paddinghorizontal: 0.0,
            hintText: 'Enter food name',
            idlebordercolor: GFColors.ALT,
            controller: controller.controller,
            editingbordercolor: GFColors.ALT,
            iconPrefix: const Icon(Icons.edit, size: 16),
          ),
          const SizedBox(height: 10),
          const GFTypography(
            text: 'Select Category',
            type: GFTypographyType.typo5,
            showDivider: false,
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              SelectionTypeCard(
                selectionType: SelectionType.drink,
                icon: Icons.local_cafe,
              ),
              SizedBox(width: 8),
              SelectionTypeCard(
                selectionType: SelectionType.food,
                icon: Icons.lunch_dining,
              ),
            ],
          ),
          const SizedBox(height: 16),
          GFButton(
            elevation: 0.1,
            fullWidthButton: true,
            text: isEdit ? 'Update Selection' : 'Add To List',
            onPressed: () {
              if (isEdit) {
                controller.updateSelection(index!);
                GFToast.showToast(
                  'Updated Successfully!',
                  context,
                  toastPosition: GFToastPosition.BOTTOM,
                );
              } else {
                controller.addToSelection();
                GFToast.showToast(
                  'Added Successfully!',
                  context,
                  toastPosition: GFToastPosition.BOTTOM,
                );
              }
              Navigator.of(context).pop();
            },
          ),
          if (isEdit)
            GFButton(
              elevation: 0.1,
              fullWidthButton: true,
              color: GFColors.DANGER,
              text: 'Delete From List',
              onPressed: () {
                controller.removeFromSelection(index!);
                GFToast.showToast(
                  'Deleted Successfully!',
                  context,
                  toastPosition: GFToastPosition.BOTTOM,
                );

                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }
}
