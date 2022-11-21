import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/myfatoorah_controller.dart';

class MyFatoorahViewWidget extends GetWidget<MyFatoorahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "MyFatoorah Payment".tr,
          style: Get.textTheme.headline6.merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Obx(() {
            return WebView(
                initialUrl: controller.url.value,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController _con) {
                  controller.webView = _con;
                },
                onPageFinished: (String url) {
                  controller.url.value = url;
                  controller.showConfirmationIfSuccess();
                  controller.progress.value = 1;
                  log(url);
                });
          }),
          Obx(() {
            if (controller.progress.value < 1) {
              return SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor:
                      Get.theme.colorScheme.secondary.withOpacity(0.2),
                ),
              );
            } else {
              return SizedBox();
            }
          })
        ],
      ),
    );
  }
}
