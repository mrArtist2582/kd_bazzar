import 'package:kd_bazzar/common_widgets/custom_button.dart';
import 'package:kd_bazzar/consts/consts.dart';
import 'package:kd_bazzar/consts/list.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // swiper selection
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    // ratings
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    // title and detail
                    title!.text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .size(16)
                        .make(),
                    10.heightBox,
                    "\u20B9500.00".text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),

                    10.heightBox,
                    Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Seller".text.white
                                      .fontFamily(semibold)
                                      .make(),
                                  5.heightBox,
                                  "In House Brand".text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .size(14)
                                      .make(),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.message_rounded,
                                color: darkFontGrey,
                              ),
                            ),
                          ],
                        ).box
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),

                    // color selection
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) =>
                                    VxBox()
                                        .size(40, 40)
                                        .roundedFull
                                        .color(Vx.randomPrimaryColor)
                                        .margin(
                                          EdgeInsets.symmetric(horizontal: 4),
                                        )
                                        .make(),
                              ),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),

                        // quantity row
                          Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                             children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                              "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                              10.widthBox,
                              "(0 Available)".text.size(12).color(darkFontGrey).make(),
                             ],
                            ),
                            
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),


                        // total row
                         Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total Price: ".text.color(textfieldGrey).make(),
                            ),
                          
                            "\u20B9 0.00".text.color(redColor).fontFamily(bold).size(16).make(),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                      10.heightBox,
                    // description
                    "Description".text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .size(16)
                        .make(),

                        10.heightBox,
                    "This is a dummy item and dummy description here. this is nice product. you should buy atleast once.".text.color(darkFontGrey).make(),
                    10.heightBox,

                    // buttons section
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(ItemDetailButtonsList.length, (index) =>
                      ListTile(
                        title: ItemDetailButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                        trailing: Icon(Icons.arrow_forward_ios),
                      )),
                    ),
                     20.heightBox,
                     // product my you like
                     productmayyoulike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
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
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: customButton(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: "Add to Cart",
            ),
          ),
        ],
      ),
    );
  }
}
