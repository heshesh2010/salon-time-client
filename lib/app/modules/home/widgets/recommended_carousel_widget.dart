/*
 * File name: recommended_carousel_widget.dart
 * Last modified: 2022.02.11 at 01:33:14
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/salon_availability_badge_widget.dart';
import '../controllers/home_controller.dart';
import 'salon_main_thumb_widget.dart';

class RecommendedCarouselWidget extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            scrollDirection: Axis.vertical,
            itemCount: controller.salons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 200
                // childAspectRatio: 0.75,
                ),
            itemBuilder: (context, index) {
              var _salon = controller.salons.elementAt(index);
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SALON, arguments: {
                    'salon': _salon,
                    'heroTag': 'recommended_carousel'
                  });
                },
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SalonMainThumbWidget(salon: _salon),
                      //      SizedBox(height: 2),
                      //      SalonThumbsWidget(salon: _salon),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        //      height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _salon.name ?? '',
                              maxLines: 2,
                              style: Get.textTheme.bodyText2
                                  .merge(TextStyle(color: Get.theme.hintColor)),
                            ),
                            Text(
                              Ui.getDistance(_salon.distance),
                              style: Get.textTheme.bodyText1,
                            ),
                            SizedBox(height: 8),
                            Wrap(
                              spacing: 5,
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              children: [
                                Wrap(
                                  children: Ui.getStarsList(_salon.rate),
                                ),
                                SalonAvailabilityBadgeWidget(salon: _salon),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
