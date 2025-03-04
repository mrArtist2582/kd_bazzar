import 'dart:io';

import 'package:get/get.dart';
import 'package:kd_bazzar/common_widgets/bg.dart';
import 'package:kd_bazzar/common_widgets/custom_button.dart';
import 'package:kd_bazzar/common_widgets/custom_textfield.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/controllers/profile_controller.dart';

class EditProfile extends StatelessWidget {
  final dynamic data;
  const EditProfile({super.key , this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return bg(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () =>
              Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [



                      controller.profileImgPath.isEmpty
                          ? Image.asset(
                            imgProfile2,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.file(
                            File(controller.profileImgPath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),




                          
                      10.heightBox,

                      customButton(
                        color: redColor,
                        onPress: () {
                          controller.changeImage(context);
                          //  Get.find<ProfileController>().changeImage(context);
                        },
                        textColor: whiteColor,
                        title: "Change",
                      ),
                      Divider(),
                      20.heightBox,
                      customTextField(
                        hint: nameHint,
                        title: name,
                        isPass: false,
                      ),

                      customTextField(
                        hint: passwordHint,
                        title: password,
                        isPass: true,
                      ),

                      20.heightBox,
                      SizedBox(
                        width: context.screenWidth - 60,
                        child: customButton(
                          color: redColor,
                          onPress: () {},
                          textColor: whiteColor,
                          title: "Save",
                        ),
                      ),
                    ],
                  ).box.white.shadowSm
                  .padding(EdgeInsets.all(16))
                  .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
                  .rounded
                  .make(),
        ),
      ),
    );
  }
}
