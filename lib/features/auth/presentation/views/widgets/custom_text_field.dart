import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.onchange,
    this.labelText,
    this.iconData,
    this.validator,
    this.isobscure=false, this.iconButton
   
  });
  final String? labelText;
  final IconData? iconData;
  final String? Function(String?)? validator;
final  bool isobscure;


 

  Function(String)? onchange;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       
      obscureText:  isobscure,
      validator: validator,
      onChanged: onchange,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
         suffixIcon:iconButton,
         
            
          
        labelText: labelText,
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        
        ),
      ),
    );
  }
}
