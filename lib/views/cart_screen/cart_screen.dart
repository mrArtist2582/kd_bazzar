
import 'package:kd_bazzar/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        
        color: Colors.white,
        child: "Cart is empty".text.fontFamily(semibold).color(darkFontGrey).makeCentered(),
      ),
    );
  }
}