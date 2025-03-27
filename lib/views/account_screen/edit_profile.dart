import 'package:get/get.dart';
import 'package:kd_bazzar/common_widgets/bg.dart';
import 'package:kd_bazzar/common_widgets/custom_button.dart';
import 'package:kd_bazzar/common_widgets/custom_textfield.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/controllers/profile_controller.dart';

class EditProfile extends StatelessWidget {
  final dynamic data;
  const EditProfile({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    // List of predefined avatars
    List<String> avatarList = [
      "assets/avatars/avatar1.png",
      "assets/avatars/avatar2.png",
      "assets/avatars/avatar3.png",
      "assets/avatars/avatar4.png",
      "assets/avatars/avatar5.png",
    ];

    return bg(
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Profile")),
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Display Selected Avatar
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.selectedAvatar.value.isNotEmpty
                          ? AssetImage(controller.selectedAvatar.value)
                          : AssetImage(avatarList.first), // Default avatar
                    ),
                    const SizedBox(height: 10),

                    // Avatar Selection List
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: avatarList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectedAvatar.value = avatarList[index];
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(avatarList[index]),
                                child: controller.selectedAvatar.value == avatarList[index]
                                    ? const Icon(Icons.check_circle, color: Colors.green, size: 30)
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 20),

                    // Name Text Field
                    customTextField(
                      controller: controller.nameController,
                      hint: nameHint,
                      title: name,
                      isPass: false,
                    ),

                    // Password Text Field
                    customTextField(
                      controller: controller.passController,
                      hint: passwordHint,
                      title: password,
                      isPass: true,
                    ),

                    const SizedBox(height: 20),

                    // Save Button with Loading Indicator
                    controller.isLoading.value
                        ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor))
                        : SizedBox(
                            width: context.screenWidth - 60,
                            child: customButton(
                              color: redColor,
                              onPress: () async {
                                controller.isLoading(true);
                                await controller.updateProfile(
                                  controller.nameController.text.trim(),
                                  controller.passController.text.trim(),
                                );
                                // ignore: use_build_context_synchronously
                                VxToast.show(context, msg: "Profile Updated");
                                controller.isLoading(false);
                              },
                              textColor: whiteColor,
                              title: "Save",
                            ),
                          ),
                  ],
                ).box.white.shadowSm.padding(const EdgeInsets.all(16)).rounded.make(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
