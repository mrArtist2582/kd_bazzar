// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:kd_bazzar/common_widgets/app_logo.dart';
import 'package:kd_bazzar/common_widgets/bg.dart';
import 'package:kd_bazzar/common_widgets/custom_textfield.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/controllers/auth_controller.dart';
import 'package:kd_bazzar/views/home_screen/home.dart';
//import 'package:kd_bazzar/views/auth_scrrens/login_screen.dart';

import '../../common_widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheck = false;
  var controller =Get.put(AuthController());

  // text controllers
   var nameController = TextEditingController();
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var passwordRetypeController = TextEditingController();
   

  @override
  Widget build(BuildContext context) {
    return bg(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogo(),
              10.heightBox,
              "Join the to $appname".text
                  .fontFamily(bold)
                  .white
                  .size(18)
                  .make(),
              30.heightBox,
              Column(
                    children: [
                      customTextField(hint: nameHint, title: name,controller: nameController,isPass: false),
                      customTextField(hint: emailHint, title: email,controller: emailController,isPass:false),
                      customTextField(hint: passwordHint, title: password,controller: passwordController,isPass: true),
                      customTextField(
                        hint: passwordHint,
                        title: reTypePassword,
                        controller: passwordRetypeController,
                        isPass: true
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: forgetPass.text.make(),
                        ),
                      ),

                      5.heightBox,

                      Row(
                        children: [
                          Checkbox(
                            checkColor: whiteColor,
                            activeColor: redColor,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue!;
                              });
                            },
                          ),
                          10.widthBox,

                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),

                                  TextSpan(
                                    text: termsAndCon,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.heightBox,
                      customButton(
                        color: isCheck == true ? redColor : lightGrey,
                        title: "Sign Up",
                        textColor: whiteColor,
                        onPress: () async {
                          if(isCheck != false){
                            try{
                              await controller.signupMethod(
                                context: context,
                                email: emailController.text,
                                password: passwordController.text
                              ).then((value) {
                                  return controller.storeUserData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text
                                  );
                              }).then((value) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => Home());
                              });
                            }catch (e){
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());

                            }
                          }
                          //  Get.to(() => LoginScreen());
                        },
                      ).box.width(context.screenWidth - 50).make(),

                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          alreadyHaveAcc.text.color(fontGrey).make(),
                          login.text.color(redColor).make().onTap(() {
                            Get.back();
                          }),
                        ],
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
