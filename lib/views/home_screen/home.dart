// ignore_for_file: unnecessary_import, library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/controllers/auth_controller.dart';
import 'package:kd_bazzar/controllers/home_controller.dart';
import 'package:kd_bazzar/views/account_screen/account_screen.dart';
import 'package:kd_bazzar/views/auth_scrrens/login_screen.dart';
import 'package:kd_bazzar/views/cart_screen/cart_screen.dart';
import 'package:kd_bazzar/views/categories_screen/categories_screen.dart';
import 'package:kd_bazzar/views/home_screen/home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // init  home controller

    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
        icon: Image.asset(icHome, width: 26),
        label: home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icCategories, width: 26),
        label: categories,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icCart, width: 26),
        label: cart,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icProfile, width: 26),
        label: account,
      ),
    ];

    var navBody = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      AccountScreen(),
    ];
    return Scaffold(
     drawer: Drawer(
  child: StreamBuilder(
    stream: firestore.collection(userCollection).doc(currentUser!.uid).snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      }

      var userData = snapshot.data!.data() as Map<String, dynamic>;
      int avatarIndex = int.tryParse(userData["avatarIndex"].toString()) ?? 0;

      // List of predefined avatars
      List<String> avatarList = [
        "assets/avatars/avatar1.png",
        "assets/avatars/avatar2.png",
        "assets/avatars/avatar3.png",
        "assets/avatars/avatar4.png",
        "assets/avatars/avatar5.png",
      ];

      return ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: redColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(avatarList[avatarIndex]),
                ),
                SizedBox(height: 10),
                Text(
                  'Hello, ${userData["name"] ?? "User"}!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userData["email"] ?? 'No email found',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: darkFontGrey),
            title: Text('Home'),
            onTap: () {
              Get.to(() => Home());
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.category, color: darkFontGrey),
            title: Text('Categories'),
            onTap: () {
              Get.to(() => CategoriesScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: darkFontGrey),
            title: Text('Cart'),
            onTap: () {
              Get.to(() => CartScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: darkFontGrey),
            title: Text('Profile'),
            onTap: () {
              Get.to(() => AccountScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout'),
            onTap: () async {
              await Get.put(AuthController()).signoutMethod();
              Get.offAll(() => const LoginScreen());
            },
          ),
        ],
      );
    },
  ),
),

      appBar: AppBar(
        backgroundColor: redColor,
        title: Text('KD Bazzar', style: TextStyle(fontFamily: bold)),

        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
