import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBuilder {
  static foregroundNotification(String title, String description,
      {VoidCallback? onTap, String? imgSrc}) async {
    Get.snackbar('', '',
        padding: EdgeInsets.zero,
        overlayBlur: 0,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 4),
        barBlur: 0,
        maxWidth: Get.width,
        titleText: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkResponse(
                      child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          )),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        width: Get.width * 0.88,
                        margin: const EdgeInsets.only(bottom: 16, top: 16),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.8,
                                  child: Text(title,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left),
                                ),
                                SizedBox(
                                  width: Get.width * 0.8,
                                  child: Text(
                                    description,
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
