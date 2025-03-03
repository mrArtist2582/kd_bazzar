// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/controllers/home_controller.dart';
import 'package:kd_bazzar/views/account_screen/account_screen.dart';
import 'package:kd_bazzar/views/cart_screen/cart_screen.dart';
import 'package:kd_bazzar/views/categories_screen/categories_screen.dart';
import 'package:kd_bazzar/views/home_screen/home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // init  home controller

    var controller = Get.put(HomeController());

    var navbarItem =[
      BottomNavigationBarItem(
        icon: Image.asset(icHome , width: 26,),
        label: home,
      ),
        BottomNavigationBarItem(
        icon: Image.asset(icCategories , width: 26,),
        label: categories,
      ),
        BottomNavigationBarItem(
        icon: Image.asset(icCart , width: 26,),
        label: cart,
      ),
        BottomNavigationBarItem(
        icon: Image.asset(icProfile , width: 26,),
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
      body:Column(
        children: [
          Obx(() =>
             Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() =>
         BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          items: navbarItem,
          onTap: (value){
            controller.currentNavIndex.value = value;
          },
          
          ),
      ),
    );
  }
}