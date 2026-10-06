import 'package:flutter/material.dart';

Future<dynamic> showDialogMethod(
  BuildContext context, {
  required String title,
  required List<Widget> fields,
  required Function() onPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        title: Text(title),

        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: fields
                .map(
                  (field) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: field,
                  ),
                )
                .toList(),
          ),
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),

          ElevatedButton(onPressed: onPressed, child: const Text("إضافة")),
        ],
      );
    },
  );
}
