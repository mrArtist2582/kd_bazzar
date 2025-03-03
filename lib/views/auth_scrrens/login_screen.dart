import 'package:get/get.dart';
import 'package:kd_bazzar/common_widgets/app_logo.dart';
import 'package:kd_bazzar/common_widgets/bg.dart';
import 'package:kd_bazzar/common_widgets/custom_button.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/consts/list.dart';
import 'package:kd_bazzar/views/auth_scrrens/sign_up.dart';
import 'package:kd_bazzar/views/home_screen/home.dart';
// ignore: unnecessary_import
import 'package:velocity_x/velocity_x.dart';

import '../../common_widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bg(
      child: Scaffold(
        resizeToAvoidBottomInset: false ,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogo(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                    children: [
                      customTextField(hint: emailHint, title: email),
                      customTextField(hint: passwordHint, title: password),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: forgetPass.text.make(),
                        ),
                      ),
                      5.heightBox,
                      customButton(
                        color: redColor,
                        title: "Log in",
                        textColor: whiteColor,
                        onPress: () {
                          Get.to(() =>Home());
                        },
                      ).box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      createNewAcc.text.color(fontGrey).make(),
                      5.heightBox,
                      customButton(
                        color: const Color.fromARGB(255, 255, 231, 182),
                        title: "Sing Up",
                        textColor: redColor,
                        onPress: () {
                          Get.to(() => SignUp());
                        },
                      ).box.width(context.screenWidth - 50).make(),

                      10.heightBox,
                      loginWith.text.color(fontGrey).make(),
                      5.heightBox,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(socialIconList[index], width: 30,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).box.white.rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
