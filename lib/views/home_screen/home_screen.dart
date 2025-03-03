import 'package:kd_bazzar/common_widgets/home_buttons.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/consts/list.dart';
import 'package:kd_bazzar/views/home_screen/components/featured_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                color: lightGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: search,
                    hintStyle: TextStyle(color: textfieldGrey),
                  ),
                ),
              ),
      
              10.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // slider brands
                      VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: sliderList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(sliderList[index], fit: BoxFit.fill)
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        },
                      ),
                      10.heightBox,
                      // deal buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          2,
                          (index) => homeButtons(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 2.5,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? todayDeal : fleshSale,
                          ),
                        ),
                      ),
      
                      //  2nd slider brands
                      10.heightBox,
                      VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSliderList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                                secondSliderList[index],
                                fit: BoxFit.fill,
                              ).box.rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        },
                      ),
                      10.heightBox,
      
                      // category button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
                        children: List.generate(
                          3,
                          (index) => homeButtons(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 3.5,
                            icon:
                                index == 0
                                    ? icTopCategories
                                    : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title:
                                index == 0
                                    ? topCategories
                                    : index == 1
                                    ? brand
                                    : topSellers,
                          ),
                        ),
                      ),
      
                      // featured categories
                      20.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                            featuredCategories.text
                                .color(darkFontGrey)
                                .size(18)
                                .fontFamily(semibold)
                                .make(),
                      ),
      
                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              List.generate(
                                3,
                                (index) => Column(
                                  children: [
                                    featuredButton(
                                      icon: featuredList1[index],
                                      title: featuredTitle1[index],
                                    ),
                                    10.heightBox,
                                    featuredButton(
                                      icon: featuredList2[index],
                                      title: featuredTitle2[index],
                                    ),
                                  ],
                                ),
                              ).toList(),
                        ),
                      ),
      
                      // featured product
                      20.heightBox,
                      Container(
                        padding: EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: BoxDecoration(color: redColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredProduct.text.white
                                .fontFamily(bold)
                                .size(18)
                                .make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  6,
                                  (index) =>
                                      Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                imgP1,
                                                width: 150,
                                                fit: BoxFit.cover,
                                              ),
                                              10.heightBox,
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
                                          ).box
                                          .margin(
                                            EdgeInsets.symmetric(horizontal: 4),
                                          )
                                          .white
                                          .roundedSM
                                          .padding(EdgeInsets.all(8))
                                          .make(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
      
                      // third swiper
                      20.heightBox,
                      VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSliderList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                                secondSliderList[index],
                                fit: BoxFit.fill,
                              ).box.rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        },
                      ),
      
                      // all products
                      20.heightBox,
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300,
                            ),
                        itemBuilder: (context, index) {
                            return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP5,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child:
                                          "Laptop 8GB/512GB".text
                                              .fontFamily(semibold)
                                              .color(darkFontGrey)
                                              .make(),
                                    ),
                                    10.heightBox,
                                    "₹65,000".text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                ],
                              ).box.white
                              .margin(EdgeInsets.symmetric(horizontal: 12))
                              .roundedSM
                              .padding(EdgeInsets.all(12))
                              .make();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    
  }
}
