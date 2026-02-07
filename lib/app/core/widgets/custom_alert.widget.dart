import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DialogType { confirm, loading, success, error }

class CustomAlert {
  /// show dialog reusable
  static void show({
    required DialogType type,
    String? title,
    String? middleText,
    Widget? content, // kalau mau custom content
    String textConfirm = "OK",
    String textCancel = "Batal",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    switch (type) {
      case DialogType.confirm:
        Get.defaultDialog(
          title: title ?? "Konfirmasi",
          middleText: middleText ?? "Apakah kamu yakin?",
          content: content,
          textCancel: textCancel,
          textConfirm: textConfirm,
          onConfirm: () {
            if (onConfirm != null) onConfirm();
            Get.back();
          },
          onCancel: () {
            if (onCancel != null) onCancel();
          },
        );
        break;

      case DialogType.loading:
        Get.dialog(
          WillPopScope(
            onWillPop: () async => false, // disable back button
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text(
                    title ?? "Loading...",
                    style: TextStyle(color: Colors.white),
                  ),
                  if (content != null) content,
                ],
              ),
            ),
          ),
          barrierDismissible: false,
        );
        break;

      case DialogType.success:
        Get.defaultDialog(
          title: title ?? "Berhasil",
          middleText: middleText ?? "Aksi berhasil dilakukan",
          content: content,
          textConfirm: textConfirm,
          onConfirm: () {
            if (onConfirm != null) onConfirm();
            Get.back();
          },
        );
        break;

      case DialogType.error:
        Get.defaultDialog(
          title: title ?? "Gagal",
          middleText: middleText ?? "Terjadi kesalahan",
          content: content,
          textConfirm: textConfirm,
          onConfirm: () {
            if (onConfirm != null) onConfirm();
            Get.back();
          },
        );
        break;
    }
  }
}
