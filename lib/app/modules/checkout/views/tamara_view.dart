import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tamara_sdk/tamara_sdk.dart';

import '../../global_widgets/circular_loading_widget.dart';
import '../controllers/tamara_controller.dart';

class TamaraView extends GetWidget<TamaraController> {
  const TamaraView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TamaraView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return CircularLoadingWidget(height: 200);
        }

        return TamaraCheckout(
          //     key:"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhY2NvdW50SWQiOiIyNTQ3Zjk0Ny05ZWZiLTRlMGUtOWM4My0zZjQ5NjI1ZjY5Y2UiLCJ0eXBlIjoibWVyY2hhbnQiLCJzYWx0IjoiMmYzODQ1OGRjOWJhNDBlOTJlMjQ3YmFlNDIyODVjY2IiLCJpYXQiOjE2NjgzNDMyNjUsImlzcyI6IlRhbWFyYSJ9.MNfoJynr8hiUceVUd7VeOgEg6TnRZoJ1CpAjhrJUr5td8brfZLlfRYoyX7uzO8aRbCNJnTPB7LMZ1QPVzNQ0gaIgIlhb3PXajS0O5nh_fPgdEwiyyE1ErROlHhgEyv2Ef7VYHWNtLcS_F6ZTOFTOPYYxhdN4eBsM2AYDuqo7ws7KqMxizmH2C44g7-xshzJK2IKyy_Ab4SDo3vTYSDG4Y1ASmZTf66feMSklPGg7IHPxR00k5D5e7LZIpmPkZ9bs4jqjHVe-umVouDHI56arkj-9V4fn29aS-tPamJ2TAg1oQ6Yl9iIvFTC9Bc3vYfnqgGfKIZVKmwsclxsx9vdVpA"
          controller.response["checkout_url"],
          "https://salontime.app/checkout/success",
          "https://salontime.app/checkout/failure",
          "https://salontime.app/checkout/cancel",
          onPaymentSuccess: () {
            Get.log(" payment Success");

            controller.onPaymentSuccess();
          },
          onPaymentFailed: () {
            Get.log(" payment Failed");

            //   _onPaymentFailed();
          },
          onPaymentCanceled: () {
            Get.log(" payment Canceled");

            //      _onPaymentCanceled();
          },
        );
      }),
    );
  }
}
