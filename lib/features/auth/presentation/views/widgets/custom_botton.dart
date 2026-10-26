import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({this.nameButton, this.onpressed});
  final String? nameButton;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return 
       Material(
        
        color:  Color(0xFF1A2BFF),
        borderRadius: BorderRadius.circular(40),
        child: InkWell(

          onTap: onpressed,
          borderRadius: BorderRadius.circular(40),
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text('$nameButton',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
               
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward,
                                color: Colors.white, size: 20),
                  ),
                 
                        
              ],
            ),
          ),
        ),

       );
  }
}
