import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:kd_bazzar/common_widgets/bg.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/consts/list.dart';
import 'package:kd_bazzar/controllers/auth_controller.dart';
import 'package:kd_bazzar/controllers/profile_controller.dart';
import 'package:kd_bazzar/services/firestore_services.dart';
import 'package:kd_bazzar/views/account_screen/components/details_card.dart';
import 'package:kd_bazzar/views/account_screen/edit_profile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    List<String> avatarList = [
      "assets/avatars/avatar1.png",
      "assets/avatars/avatar2.png",
      "assets/avatars/avatar3.png",
      "assets/avatars/avatar4.png",
      "assets/avatars/avatar5.png",
    ];

    return bg(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error loading data"));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No user data available"));
            }

            var data = snapshot.data!.docs.first;
            var avatarIndex = int.tryParse(data["avatarIndex"].toString()) ?? 0;
            avatarIndex = avatarIndex.clamp(0, avatarList.length - 1);

            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.edit, color: whiteColor).onTap(() {
                        controller.nameController.text = data['name'] ?? '';
                        controller.passController.text = data['password'] ?? '';
                        controller.selectedAvatar.value =
                            avatarList[avatarIndex];
                        Get.to(() => EditProfile(data: data));
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(avatarList[avatarIndex]),
                        ),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name'] ?? 'User'}".text
                                  .fontFamily(semibold)
                                  .white
                                  .size(12)
                                  .make(),
                              "${data['email'] ?? 'No Email'}".text
                                  .size(12)
                                  .white
                                  .make(),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            if (!Get.isRegistered<AuthController>()) {
                              Get.lazyPut(() => AuthController());
                            }

                            await Get.find<AuthController>().signoutMethod();

                            // Ensure the user is redirected to the LoginScreen after logout
                            Get.offAllNamed(
                              "/LoginScreen",
                            ); // This will remove all previous routes from history
                          },
                          child: logout.text.white.make(),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCart(
                        count: data["cart_count"]?.toString() ?? "0",
                        title: "In your cart",
                        width: context.screenWidth / 3.4,
                      ),
                      detailsCart(
                        count: data["wishlist_count"]?.toString() ?? "0",
                        title: "Wishlist",
                        width: context.screenWidth / 3.4,
                      ),
                      detailsCart(
                        count: data["order_count"]?.toString() ?? "0",
                        title: "Your orders",
                        width: context.screenWidth / 3.4,
                      ),
                    ],
                  ),
                  ListView.separated(
                        separatorBuilder:
                            (context, index) => Divider(color: lightGrey),
                        shrinkWrap: true,
                        itemCount: profileButtonsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(
                              profileButtonIcons[index],
                              width: 22,
                            ),
                            // ignore: unnecessary_string_interpolations
                            title:
                                profileButtonsList[index].text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                          );
                        },
                      ).box.white.rounded
                      .margin(EdgeInsets.all(12))
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .shadowSm
                      .make()
                      .box
                      .color(redColor)
                      .make(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
