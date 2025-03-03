// ignore_for_file: unnecessary_string_interpolations

import 'package:get/route_manager.dart';
import 'package:kd_bazzar/common_widgets/bg.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/consts/list.dart';
import 'package:kd_bazzar/views/categories_screen/categories_details.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bg(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.white.fontFamily(bold).make(),
        ),
        body: Container(
           padding: EdgeInsets.all(12),
           child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8,crossAxisSpacing: 8, mainAxisExtent: 200), itemBuilder: (context, index){
            return Column(
              children: [
                Image.asset(categoriesImages[index],height: 120, width: 200, fit: BoxFit.cover,
                ),
                 10.heightBox,
                 "${categoriesList[index]}".text.color(darkFontGrey).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap((){
              Get.to(() => CategoriesDetails(title: categoriesList[index]));
            });
           }),
        ),
      )
    );
  }
}