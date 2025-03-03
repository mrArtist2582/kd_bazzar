import 'package:kd_bazzar/consts/consts.dart';

Widget customButton({VoidCallback? onPress, String? title, Color? color, Color? textColor}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color ?? redColor, 
      padding: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
      ),
    ),
    onPressed: onPress, 
    child: title?.text.color(textColor ?? Colors.white).fontFamily(bold).make(),
  );
}
