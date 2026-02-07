import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';

enum DialogType { confirm, loading, success, error }

class CustomDialog {
  static void show({
    required DialogType type,
    String? title,
    String? middleText,
    Widget? content,
    String textConfirm = "OK",
    String textCancel = "Batal",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
    bool contentOnTop = false,
  }) {
    Get.generalDialog(
      barrierDismissible: type == DialogType.loading
          ? false
          : barrierDismissible,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return WillPopScope(
          onWillPop: () async => type != DialogType.loading,
          child: Center(
            child: Material(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: _buildBody(
                  type: type,
                  title: title,
                  middleText: middleText,
                  content: content,
                  textConfirm: textConfirm,
                  textCancel: textCancel,
                  onConfirm: onConfirm,
                  onCancel: onCancel,
                  contentOnTop: contentOnTop,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildBody({
    required DialogType type,
    String? title,
    String? middleText,
    Widget? content,
    required String textConfirm,
    required String textCancel,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    required bool contentOnTop,
  }) {
    if (type == DialogType.loading) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (contentOnTop && content != null) ...[
            content,
            const SizedBox(height: 12),
          ],
          CircularProgressIndicator(color: mainColor),
          if (title != null) ...[
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
          if (!contentOnTop && content != null) ...[
            const SizedBox(height: 12),
            content,
          ],
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (contentOnTop && content != null) ...[
          content,
          const SizedBox(height: 12),
        ],
        if (title != null) ...[
          Text(
            title ?? _defaultTitle(type),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
        if (middleText != null) ...[
          const SizedBox(height: 8),
          Text(middleText, textAlign: TextAlign.center),
        ],
        if (!contentOnTop && content != null) ...[
          const SizedBox(height: 12),
          content,
        ],

        if (type == DialogType.confirm) ...[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: mainColor, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (onCancel != null) onCancel();
                  Get.back();
                },
                child: Text(
                  textCancel,
                  style: GoogleFonts.barlow(
                    color: mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (onConfirm != null) onConfirm();
                  Get.back();
                },
                child: Text(
                  textConfirm,
                  style: GoogleFonts.barlow(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  static String _defaultTitle(DialogType type) {
    switch (type) {
      case DialogType.confirm:
        return "Konfirmasi";
      case DialogType.success:
        return "Berhasil";
      case DialogType.error:
        return "Gagal";
      case DialogType.loading:
        return "Loading...";
    }
  }
}
