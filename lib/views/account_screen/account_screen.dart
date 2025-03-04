import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:kd_bazzar/common_widgets/bg.dart';
import 'package:kd_bazzar/consts/consts.dart';
// ignore: library_prefixes
import 'package:kd_bazzar/consts/list.dart';

import 'package:kd_bazzar/controllers/auth_controller.dart';
import 'package:kd_bazzar/controllers/profile_controller.dart';
import 'package:kd_bazzar/services/firestore_services.dart';
import 'package:kd_bazzar/views/account_screen/components/details_card.dart';
import 'package:kd_bazzar/views/account_screen/edit_profile.dart';
import 'package:kd_bazzar/views/auth_scrrens/login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bg(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.edit, color: whiteColor),
                      ).onTap(() {
                        Get.to(() => EditProfile(data: data));
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            imgProfile2,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}".text
                                    .fontFamily(semibold)
                                    .white
                                    .size(12)
                                    .make(),
                                "${data['email']}".text.size(12).white.make(),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                            ),
                            onPressed: () async {
                              await Get.put(
                                AuthController(),
                              ).signoutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child:
                                logout.text
                                    .fontFamily(semibold)
                                    .size(12)
                                    .white
                                    .make(),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCart(
                          count: data["cart_count"],
                          title: "In your cart",
                          width: context.screenWidth / 3.4,
                        ),

                        detailsCart(
                          count: data["wishlist_count"],
                          title: "Wishlist",
                          width: context.screenWidth / 3.4,
                        ),

                        detailsCart(
                          count: data["order_count"],
                          title: "Your orders",
                          width: context.screenWidth / 3.4,
                        ),
                      ],
                    ),

                    // buttons section
                    ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(color: lightGrey);
                          },
                          shrinkWrap: true,
                          itemCount: profileButtonsList.length,
                          itemBuilder: (context, int index) {
                            return ListTile(
                              leading: Image.asset(
                                profileButtonIcons[index],
                                width: 22,
                              ),
                              title:
                                  " ${profileButtonsList[index]}".text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                            );
                          },
                        ).box.white.rounded
                        .margin(EdgeInsetsDirectional.all(12))
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .shadowSm
                        .make()
                        .box
                        .color(redColor)
                        .make(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
