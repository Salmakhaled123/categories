import 'package:flutter/material.dart';
class AddToCartOrOutOfStockButton extends StatelessWidget {
  const AddToCartOrOutOfStockButton({super.key, required this.backgroundColor, required this.text});
  final Color backgroundColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: () {},
        child:  FittedBox(fit:BoxFit.scaleDown ,
          child: Text(textAlign: TextAlign.center,
            text, style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold,),),
        )) ;
  }
}
