import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../common/colors.dart';

class CustomButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;

  CustomButton({
    required this.iconData,
    required this.text,
    required this.onPressed,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.transparent, // Initial transparent background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              Icon(
                iconData,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class Buttonui extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  Buttonui({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(253, 136, 136, 0.7019607843137254),
                  Color.fromRGBO(151, 204, 248, 1.0),
                ]
            )
        ),
        child: Center(
          child:
      Text(text, style: TextStyle(color:white,fontSize: 18, fontWeight: FontWeight.bold),),
        ),
      ),
    );

  }
}
class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomOutlinedButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: onPressed,
     child: OutlineGradientButton(
       child: Center(
         child: Text(
           text,
           style: TextStyle(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
         ),
       ),
       gradient: kPrimaryGradientColor,
       strokeWidth: 2,
       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
       radius: Radius.circular(20),
     ),
   );

  }
}








class Button extends StatelessWidget {
  final Function? onTap;
  final String label;

  const Button({Key? key, this.onTap, required this.label,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical:12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:primaryColorRed,
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  final Function? onTap;
  final String label;
  final bool isLoading;

  const LoadingButton({Key? key, this.onTap, required this.label, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : () => onTap!(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isLoading ? Colors.grey : primaryColorRed,
          boxShadow: [
            BoxShadow(
              color: isLoading ? Colors.grey.withOpacity(0.2) : Colors.red.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
              : Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
