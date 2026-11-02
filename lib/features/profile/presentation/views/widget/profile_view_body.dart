import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app_clean_arch/features/profile/presentation/views/widget/build_profile_info.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final userName =
        user?.displayName ?? user?.email?.split('@').first ?? 'User';
    final userEmail = user?.email ?? 'No email available';
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Color(0xFF9B7953),
            backgroundImage: user?.photoURL != null
                ? NetworkImage(user!.photoURL!)
                : null,
            child: user?.photoURL == null
                ? Icon(Icons.person, size: 55, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 12),
          Text(
            userName,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(userEmail, style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),

          BuildProfileInfo(
            icon: Icons.shopping_bag_outlined,
            title: 'My Orders',
            onTap: () {},
          ),
          BuildProfileInfo(
            icon: Icons.favorite_border,
            title: 'My Favorites',
            onTap: () {},
          ),
          BuildProfileInfo(
            icon: Icons.location_on_outlined,
            title: 'My Addresses',
            onTap: () {},
          ),
          BuildProfileInfo(
            icon: Icons.payment_outlined,
            title: 'Payment Methods',
            onTap: () {},
          ),
          BuildProfileInfo(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {},
          ),
          const SizedBox(height: 15),
          BuildProfileInfo(
            icon: Icons.logout,
            title: 'Logout',
            iconColor: Colors.red,
            titleColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
