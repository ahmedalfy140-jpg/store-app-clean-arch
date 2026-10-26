import 'package:flutter/material.dart';
import 'package:store_app_clean_arch/features/auth/presentation/views/widgets/custom_botton.dart';
import 'package:store_app_clean_arch/features/auth/presentation/views/widgets/custom_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
   static String id = 'sign up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
   String? emailAdreess;
  String? password;
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/img8.jpg', fit: BoxFit.cover),
            ),

            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: 0.3)),
            ),
            Positioned(
              top: 25,
              left: 25,
              right: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'STYLE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 7,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'F A S H I O N   S T O R E',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,

                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 180),
                  Text(
                    'Create Your\nAccount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 54,
                      height: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Join our fashion community\nand get a latest trends  ',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F1E9),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(children: [
                    CustomTextFormField(
                      onchange: (data){
                        emailAdreess=data;

                      },
                      validator: (value){
                        if(value ==null || value.isEmpty){
                           return 'Please enter your email';
                        }if(RegExp( r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',).hasMatch(value)){
                            return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      labelText: 'Email Address',
                      iconData: Icons.email_outlined,
                    ),
                    SizedBox(height: 15,),
                    CustomTextFormField(
                        validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'please enter ypur password';
                        }
                        if (data.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onchange: (data){
                        password=data;
                      },
                      isobscure: _isObscured,
                      iconButton: IconButton(onPressed:(){
                        setState(() {
                          _isObscured=!_isObscured;
                        });
                      } , icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility)),

                       labelText: 'Password',
                      iconData: Icons.lock_outline,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blueAccent),
                        ),)),
                        SizedBox(height: 20,),
                        customButton(
                          nameButton: 'Register',
                          onpressed: (){
                            Navigator.pop(context);
                          }
                          ,
                        ),
                        const SizedBox(height: 24),

                    // Register Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?  "),
                        GestureDetector(
                          onTap: () {
                            // Navigate to registration screen
                            
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                        
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
