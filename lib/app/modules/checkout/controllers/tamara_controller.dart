import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/booking_model.dart';
import '../../../models/payment_model.dart';
import '../../../repositories/payment_repository.dart';
import '../../../routes/app_routes.dart';
import '../../bookings/controllers/booking_controller.dart';
import '../../bookings/controllers/bookings_controller.dart';
import '../../global_widgets/tab_bar_widget.dart';

class TamaraController extends GetxController {
  PaymentRepository _paymentRepository;
  RxMap response = Map().obs;
  final progress = 0.0.obs;
  final booking = new Booking().obs;
  final isLoading = true.obs;
  final payment = new Payment().obs;

  TamaraController() {
    _paymentRepository = new PaymentRepository();
  }

  @override
  void onInit() {
    if (Get.arguments['booking'] is Booking) {
      booking.value = Get.arguments['booking'] as Booking;

      iniTamraCheckout();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void iniTamraCheckout() async {
    try {
      response.value = await _paymentRepository.geTamaraUrl(booking.value);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  Future payTamaraBooking() async {
    try {
      payment.value = await _paymentRepository.createTamara(
          Booking(id: booking.value.id, payment: booking.value.payment));
      if (payment.value != null && payment.value.hasData) {
        Get.toNamed(Routes.CONFIRMATION, arguments: {
          'title': "Payment Successful".tr,
          'long_message': "Your Payment is Successful".tr,
        });
      } else {}
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  onPaymentSuccess() {
    Get.find<BookingsController>().currentStatus.value =
        Get.find<BookingsController>().getStatusByOrder(1).id;

    if (Get.isRegistered<TabBarController>(tag: 'bookings')) {
      Get.find<TabBarController>(tag: 'bookings').selectedId.value =
          Get.find<BookingsController>().getStatusByOrder(1).id;
    }
    Get.lazyPut(() => BookingController());

    //  Get.find<BookingController>().changeBookingPaymentStatus(10);
    payTamaraBooking();
  }
}
