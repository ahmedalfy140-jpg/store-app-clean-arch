import 'package:flutter/material.dart';
import 'package:store_app_clean_arch/features/profile/presentation/views/widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1E9),
          centerTitle: true,
        elevation: 0,
        title: Text('Profile',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
      

      ),
       backgroundColor: const Color(0xFFF5F1E9),
       body: ProfileViewBody(),

    );
  }
}