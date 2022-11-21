/*
 * File name: custom_pages_view.dart
 * Last modified: 2022.02.18 at 19:24:11
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../providers/laravel_provider.dart';
import '../controllers/custom_pages_controller.dart';
import '../widgets/custom_page_loading_widget.dart';

class CustomPagesView extends GetWidget<CustomPagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return Text(
              controller.customPage.value.title.tr,
              style: Get.textTheme.headline6,
            );
          }),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => {Get.back()},
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<LaravelApiClient>().forceRefresh();
            controller.refreshCustomPage(showMessage: true);
            Get.find<LaravelApiClient>().unForceRefresh();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Obx(() {
              if (controller.customPage.value.content.isEmpty) {
                return CustomPageLoadingWidget();
              } else {
                return Ui.applyHtml(controller.customPage.value.content);
                // return Ui.applyHtml(
                //     ' <h2 style="font-family: Poppins, sans-serif; color: rgb(33, 37, 41); text-align: right; direction: rtl !important;"><span style="font-family: &quot;Times New Roman&quot;;">السياسات و الشروط:</span></h2><p style="text-align: right; direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><span style="font-family: &quot;Times New Roman&quot;;">إن اتفاقية الاستخدام هذه وخصوصية الاستخدام ، والشروط والبنود ، وجميع السياسات التي تم نشرها على&nbsp;</span><span style="font-weight: bolder; direction: rtl !important; font-family: &quot;Times New Roman&quot;;">تطبيق صالون تايم</span></span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important; font-family: &quot;Times New Roman&quot;;">&nbsp;</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important; font-family: &quot;Times New Roman&quot;;">وضعت لحماية وحفظ حقوق كل من (</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important; font-family: &quot;Times New Roman&quot;;">&nbsp;</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="font-weight: bolder; color: rgb(145, 145, 145); direction: rtl !important; font-family: &quot;Times New Roman&quot;;">تطبيق صالون تايم</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important; font-family: &quot;Times New Roman&quot;;">&nbsp;) و (&nbsp;</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="font-weight: bolder; color: rgb(145, 145, 145); direction: rtl !important; font-family: &quot;Times New Roman&quot;;">المستخدم</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important; font-family: &quot;Times New Roman&quot;;">&nbsp;الذي يصل إلى التطبيق بتسجيل او من دون تسجيل )أو ( العميل المستفيد من الإعلانات بتسجيل أو من دون تسجيل).</span><br segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><br segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">تخضع البنود والشروط والأحكام والمنازعات القانونية للقوانين والتشريعات والأنظمة المعمول بها في المملكة العربية السعودية.</span><br segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><br segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">لكونك مستخدم فأنك توافق على الالتزام بكل ما يرد بهذه الاتفاقية في حال استخدامك للموقع او في حال الوصول اليه او في حالة التسجيل في الخدمة. يحق ل</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;="" font-weight:="" bolder;="" font-size:="" 1rem;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">تطبيق صالون تايم</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;="" font-size:="" 1rem;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">&nbsp;التعديل على هذه الاتفاقية في أي وقت وتعتبر ملزمة لجميع الأطراف بعد الإعلان عن التحديث في الموقع أو في أي وسيلة آخرى.</span></p><p style="text-align: right; direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;="" font-size:="" 1rem;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><br style="direction: rtl !important;"></span></p><h3 class="green" segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="font-family: Poppins, sans-serif; color: green; text-align: right; direction: rtl !important;">تعريف</h3><p style="text-align: right; direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="font-weight: bolder; color: rgb(145, 145, 145); direction: rtl !important;">&nbsp;</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">&nbsp;مؤسسة متعب عقاب متعب العتيبي للتقنية هي الجهة المالكة لتطبيق صالون تايم و هي&nbsp; مؤسسة سعودية ١٠٠ ٪ مقرها الرئيسي تبوك&nbsp; وهي منصة الكترونية تمكن المستخدم (منشئ السجل الإلكتروني ) من فتح محل إلكتروني لتقديم خدماته وإيصالها للعميل المستهدف (مستقبل السجل الإلكتروني ) وفق شروط وضوابط محددة وتحت مسؤوليته. ويشار إليها بهذه الاتفاقية باسم (</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">&nbsp;</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;="" font-size:="" 1rem;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">مؤسسة متعب عقاب متعب العتيبي&nbsp;</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;="" font-size:="" 1rem;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">&nbsp;) أو ( نحن ) أو ( لنا ) أو ( تطبيق صالون تايم ) ، وتمثل هنا الطرف الأول.</span></p><p style="text-align: right; direction: rtl !important;"><br segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">المستخدم هو ( الفرد او المؤسسة أو الشركة ) المنشئ للسجل الإلكتروني الذي يصل إلى التطبيق ويستفيد من خدماته بشكل مباشر أو غير مباشر ، ويشار إليه بالعضو أو الطرف الثاني, ويعتبر هو المسؤول عن محتوى الإعلان مسؤولية كاملة وملتزم بضوابط وشروط المحتوى الموضحة من قبل التطبيق&nbsp; ويتحمل تبعات وأضرار محتوى الإعلان.</span><br segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><br segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">العميل: هو الجهة (الفرد أو المؤسسة أو الشركة) التي ينتهي إليه السجل الإلكتروني ، والمستهدفة من قبل المستخدم (منشئ السجل الإلكتروني ).</span></p><p style="text-align: right; direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">السجل الإلكتروني: هو البيانات التي تنشأ أو تحفظ أو ترسل من قبل المستخدم ( منشئ السجل الإلكتروني ) وتكون على شكل تقديم خدمة أو طلب خدمة او ردود او رسائل خاصة.</span></p><p style="text-align: right; direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">الزبون : و هو المستفيد من الخدمات التي يقدمها العميل.&nbsp;</span></p><p style="text-align: right; direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"><br style="direction: rtl !important;"></span></p><h3 class="green" segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="font-family: Poppins, sans-serif; color: green; text-align: right; direction: rtl !important;">شروط الاستخدام</h3><p style="text-align: right; direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">بصفتك طرف ثاني في هذه الاتفاقية فإنه بموافقتك على الاستفادة من خدمات الموقع فعليك الالتزام بما يلي :</span></p><ul segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="text-align: right; color: rgb(145, 145, 145); direction: rtl !important;"><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم الإعلان أو تحميل محتوى أو عناصر غير ملائمة للتصنيفات المتاحة في التطبيق و المسموح ببيعها. وعليك مراجعة شروط الإعلان و السلع الممنوعة. بعدم الاختراق أو التحايل على قوانين وسياسة وأنظمة الموقع أو أي حقوق تتعلق بطرف ثالث.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم نسخ الإعلان من&nbsp;<span style="font-weight: bolder; direction: rtl !important;">تطبيق صالون تايم</span>&nbsp;وإعادة نشرها في مواقع أخرى.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم استخدام أي وسيلة غير شرعية للوصول للإعلانات أو لبيانات المستخدمين الآخرين أو انتهاك لسياسة وحقوق&nbsp;<span style="font-weight: bolder; direction: rtl !important;">تطبيق صالون تايم</span>،أو الوصول لمحتوى الموقع أو تجميع وتحصيل معلومات وبيانات تخص تطبيق صالون&nbsp; تايم أو عملاء التطبيق&nbsp; والاستفادة منها بأي شكل من الأشكال أو إعادة نشرها.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم استخدام خدماتنا إذا كنت غير مؤهل قانونيا لإتمام هذه الاتفاقية. على سبيل المثال أنك أقل من 18 سنة أو أنك محجوب بشكل مؤقت أو دائم من استخدام الموقع.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم التلاعب بأسعار السلع سواء في البيع او الشراء وإلحاق الضرر بالمستخدمين الآخرين.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم نشر إعلانات أو تعليقات كاذبة أو غير دقيقة أو مضللة أو خادعة أو قذف ، أو تشهير.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم التعرض للسياسات أو السيادات الدولية أو الشخصيات المعتبرة أو أي مناقشات لا تتعلق بالبيع والشراء المشروعة فيتطبيق صالون تايم.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم نقل حسابك أو نشاطك إلى مواقع اخرى بالوقت الذي هو يحمل شعار أو خدمات المؤسسة .</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم انتهاك حقوق الطبع والنشر والعلامات التجارية، وبراءات الاختراع، والدعاية وقواعد البيانات أو غيرها من حقوق الملكية أو الفكرية التي تنتمي لتطبيق صالون تايم أو مرخصة ل<span style="font-weight: bolder; direction: rtl !important;">تطبيق صالون تايم</span>.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم انتهاك حقوق الآخرين الملكية أو الفكرية أو براءة الاختراع.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم الاعلان عن منتجات التبغ والدخان (هذه السلع تعرضك للحصول على مخالفة من قبل الجهات المختصة)</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم انتهاك أنظمة حقوق الإنسان وبعدم المتاجرة بالأشخاص بأي شكل من الأشكال ويجب عليك الإلتزام<a href="https://haraj.com.sa/terms.php#add_service" style="color: rgb(4, 115, 192); direction: rtl !important;">&nbsp;بضوابط الإعلان عن تقديم الخدمات المنزلية.</a></li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم انتهاك أنظمة حماية الحياة الفطرية.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم جمع معلومات عن مستخدمي الموقع الآخرين لأغراض تجارية أو غيرها.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم الإقدام على أي ما من شأنه إلحاق الضرر بسمعة&nbsp;<span style="font-weight: bolder; direction: rtl !important;">تطبيق صالون تايم</span>.</li><li style="margin-top: 0.8rem; direction: rtl !important;">بعدم انتحال صفة&nbsp;<span style="font-weight: bolder; direction: rtl !important;">تطبيق صالون تايم</span>&nbsp;أو ممثل لها أو موظف فيها أو أي صفة توحي بأنك تابع للمؤسسة ما لم يكون لديك أذن رسمي من المؤسسة.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يُمنع إستخدام هذه الخدمة من قِبل أي مستخدم غير بشري ويستثنى من ذلك المستخدمين الغير بشريين التابعين للشركات التالية فقط:<ul style="direction: rtl !important;"><li style="margin-top: 0.8rem; direction: rtl !important;">Google</li><li style="margin-top: 0.8rem; direction: rtl !important;">Facebook</li><li style="margin-top: 0.8rem; direction: rtl !important;">Twitter</li></ul></li></ul><p style="text-align: right; direction: rtl !important;"><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">إن عدم التزامك بتلك الشروط يمنح</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">&nbsp;</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="font-weight: bolder; color: rgb(145, 145, 145); direction: rtl !important;">مؤسسة متعب عقاب متعب العتيبي للتقنية</span><span segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;">&nbsp;الحق كاملا بحجب عضويتك ومنعك من الوصول للموقع وإضافة رقم هاتفك في القائمة السوداء دون ادنى مسؤولية و دون الحاجة لإخطارك بذلك وأنت هنا تتعهد بعدم العودة لاستخدام الموقع إلى بعد موافقة الموقع على ذلك.</span><br segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="color: rgb(145, 145, 145); direction: rtl !important;"></p><p style="text-align: right; direction: rtl !important;"><br style="direction: rtl !important;"></p><h3 class="green" segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="font-family: Poppins, sans-serif; color: green; text-align: right; direction: rtl !important;">شروط اضافة محتوى لتطبيق صالون تايم</h3><ul segoe="" ui",="" "helvetica="" neue",="" sans-serif;"="" style="text-align: right; color: rgb(145, 145, 145); direction: rtl !important;"><li style="margin-top: 0.8rem; direction: rtl !important;">تتعهد بعدم الإعلان عن أي&nbsp;<a href="https://haraj.com.sa/notallowed.php" style="color: rgb(4, 115, 192); direction: rtl !important;">سلعة ممنوعة&nbsp;</a>بالتطبيق.</li><li style="margin-top: 0.8rem; direction: rtl !important;">تتعهد بعدم اضافة أي&nbsp;<a href="https://haraj.com.sa/notallowed.php" style="color: rgb(4, 115, 192); direction: rtl !important;">ردود ممنوعة&nbsp;</a>بالتطبيق</li><li style="margin-top: 0.8rem; direction: rtl !important;">تتعهد بعدم ارسال أي&nbsp;<a href="https://haraj.com.sa/notallowed.php" style="color: rgb(4, 115, 192); direction: rtl !important;">رسائل ممنوعة&nbsp;</a>ببالتطبيق.</li><li style="margin-top: 0.8rem; direction: rtl !important;">تتعهد بتحديد سعر بيع السلعة المعلن عنها.</li><li style="margin-top: 0.8rem; direction: rtl !important;">تتعهد بمتابعة إعلانك والرد على استفسارات العملاء من خلال الردود او من خلال الرسائل الخاصة.</li><li style="margin-top: 0.8rem; direction: rtl !important;">تتعهد بالالتزام بسياسة الإعلانات المكررة.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يلزم أن تكون المادة الإعلانية المعلن عنها سلعة أو خدمة فقط.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يجب أن يكون الإعلان كامل التفاصيل وفي القسم الصحيح.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يحق للتطبيق حذف أي إعلان من دون ذكر سبب الحذف.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يُمنع نسخ أي إعلان من التطبيق.</li><li style="margin-top: 0.8rem; direction: rtl !important;">أن يكون لديك تصريح مزاولة مهنة.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يُمنع استخدام أي جزء من أي إعلان في التطبيق.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يلتزم المعلن بأن تكون الصور المضافة في الإعلان لنفس السلعة و الخدمة المعلن عنها.</li><li style="margin-top: 0.8rem; direction: rtl !important;">صور المحتوى يجب أن تكون لائقة أخلاقيا وذات جودة عالية ولا تخالف نظام وزارة العمل أو حقوق الإنسان أو أي جهة حكومية أو خاصة.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يجب الإلتزام بعدم الإعلان عن السلع والخدمات التي تندرج في قائمة السلع و الخدمات الممنوعة. كما يجب أيضا الالتزام بقائمة الردود الممنوعة و الرسائل الممنوعة.</li><li style="margin-top: 0.8rem; direction: rtl !important;">تتعهد بعدم الإعلان لشخص لا تعرفه او التسجيل لشخص لا تعرفه.</li><li style="margin-top: 0.8rem; direction: rtl !important;">يخضع تحديث وتعديل الإعلان لجميع الشروط والضوابط في هذه الاتفاقية ويعتبر المستخدم مسؤول عن أي مخالفات وقعت أثناء إنشاء الإعلان او بعد التحديث او التعديل.</li><li style="margin-top: 0.8rem; direction: rtl !important;">الإنشاء والتحديث والتعديل مسؤولية المستخدم ( منشئ السجل الإلكتروني ).</li><li style="margin-top: 0.8rem; direction: rtl !important;">التزام العميل بدفع عمولة التطبيق 2.5% مقابل كل كل زبون يستفيد من الخدمة المعلن عنها في التطبيق .&nbsp;</li><li style="margin-top: 0.8rem; direction: rtl !important;">التزام العميل بدفع عمولة الدفع الالكتروني للبنوك و المقدرة ب ١.٥٪&nbsp;</li><li style="margin-top: 0.8rem; direction: rtl !important;">يدفع الزبون مبلغ ٥ ريال خدمة للصالون.&nbsp;</li></ul><p style="margin-top: 0.8rem; text-align: right; direction: rtl !important;"><span style="font-weight: bolder; direction: rtl !important;"><font style="direction: rtl !important;" color="#ff0000">سياسة المواعيد&nbsp;</font></span></p><p style="margin-top: 0.8rem; text-align: right; direction: rtl !important;"><span style="font-weight: bolder; direction: rtl !important;"><font style="direction: rtl !important;" color="#ff0000">١. إذا تم إلغاء الطلب من قبل الزبون&nbsp; بعد مرور ٢٤ ساعه من الحجز يتم إرجاع نصف المبلغ للزبون&nbsp; خلال خمسة أيام عمل.</font></span></p><p style="margin-top: 0.8rem; text-align: right; direction: rtl !important;"><span style="font-weight: bolder; direction: rtl !important;"><font style="direction: rtl !important;" color="#ff0000">٢. إذا تم إلغاء الطلب من قبل الصالون أو مقدم العمل الحر يتم إرجاع المبلغ كاملا للزبون&nbsp; خلال خمسة أيام عمل و يتحمل الصالون تكاليف معالجة إلغاء الطلب و المقدرة ب ١٠ ريالات.</font></span></p><p style="margin-top: 0.8rem; text-align: right; direction: rtl !important;"><span style="font-weight: bolder; direction: rtl !important;"><font style="direction: rtl !important;" color="#ff0000">٣. إذا رغب الزبون في تعديل الموعد ، عليه التنسيق المباشر مع الصالون أو العمل الحر و تحديد موعد جديد و إشعار الدعم الفني بذلك لتعديل الموعد.</font></span></p><p style="margin-top: 0.8rem; text-align: right; direction: rtl !important;"><span style="font-weight: bolder; direction: rtl !important;"><font style="direction: rtl !important;" color="#ff0000">٤. إذا لم يلتزم الصالون أو صاحب العمل الحر بالموعد للزبون يتم إرجاع مبلغ الحجز كاملا للزبون خلال خمسة أيام عمل.&nbsp;</font></span><span style="font-family: &quot;Tahoma&quot;;">﻿</span></p>');
              }
            }),
          ),
        ));
  }
}