import 'package:fe_lab_clinicas_adm/src/pages/checkin/widget/checkin_image_dialog.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class CheckinImageLink extends StatelessWidget {
  final String label;
  final String iamge;
  const CheckinImageLink({super.key, required this.label, required this.iamge});

  void showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CheckinImageDialog(
          context,
          pathImage: iamge,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showImageDialog(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 14,
              color: LabClinicasTheme.blueColor,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
