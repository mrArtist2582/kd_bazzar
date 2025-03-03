import 'package:kd_bazzar/consts/consts.dart';

Widget detailsCart({width ,  String? count, String? title}) {
  return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "00".text.fontFamily(bold).color(darkFontGrey).size(14).make(),
                  //  5.heightBox,
                    "in your cart".text.fontFamily(semibold).color(darkFontGrey).make(),
                  ],
                ).box.white.rounded.width(width).height(70).padding(EdgeInsets.all(4)).make();
             
}