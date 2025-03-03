import 'package:get/get.dart';
import 'package:kd_bazzar/common_widgets/bg.dart';
import 'package:kd_bazzar/consts/consts.dart';

import 'item_details.dart';

class CategoriesDetails extends StatelessWidget {
  final String? title;
  const CategoriesDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bg(
      child: Scaffold(
        appBar: AppBar(title: title!.text.fontFamily(bold).white.make()),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    6,
                    (index) =>
                        "Baby cloting".text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .size(12)
                            .makeCentered()
                            .box
                            .white
                            .rounded
                            .size(120, 60)
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .make(),
                  ),
                ),
              ),
              20.heightBox,
              // items container
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 270,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP1,
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),

                          "Laptop 8GB/512GB".text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          10.heightBox,
                          "₹65,000".text
                              .color(redColor)
                              .fontFamily(bold)
                              .size(16)
                              .make(),
                        ],
                      ).
                      box.white
                          .margin(EdgeInsets.symmetric(horizontal: 12))
                          .roundedSM
                          .outerShadowSm
                          .padding(EdgeInsets.all(12))
                          .make()
                          .onTap(() {
                            Get.to(() => ItemDetails(title: "Dummy item"));
                          });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
