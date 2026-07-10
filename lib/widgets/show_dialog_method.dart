
  import 'package:flutter/material.dart';

Future<dynamic> showDialogMethod(BuildContext context) {
    return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: const Text("إضافة مجموعة"),

                    content: TextField(
                      decoration: InputDecoration(
                        hintText: "اسم المجموعة",
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
                        onPressed: () {
                          // هنا هتضيف المجموعة
                          Navigator.pop(context);
                        },
                        child: const Text("إضافة"),
                      ),
                    ],
                  );
                },
              );
  }