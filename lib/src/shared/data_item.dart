import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  final String label;
  final String value;
  final EdgeInsetsGeometry? padding;

  const DataItem(
      {super.key, required this.label, required this.value, this.padding});

  @override
  Widget build(BuildContext context) {
    Widget widget = Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            color: LabClinicasTheme.blueColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Text(value,
            style: const TextStyle(
              color: LabClinicasTheme.orangeColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            )),
      ],
    );
    if (padding != null) {
      widget = Padding(
        padding: padding!,
        child: widget,
      );
    }
    return widget;
  }
}
