import 'package:flutter/material.dart';

Future<dynamic> showDialogMethod(
  BuildContext context, {
  required String title,
  required String content,
  required Function() onPressed,
  required TextEditingController controller,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(title),

        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: content,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),

          ElevatedButton(
            onPressed: onPressed,
            child: const Text("إضافة"),
          ),
        ],
      );
    },
  );
}