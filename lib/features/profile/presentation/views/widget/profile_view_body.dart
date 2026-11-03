
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app_clean_arch/features/profile/data/services/profile_services.dart';
import 'package:store_app_clean_arch/features/profile/presentation/manager/function/profile_logout_helper.dart';
import 'package:store_app_clean_arch/features/profile/presentation/manager/profile_image_picker.dart';

import 'package:store_app_clean_arch/features/profile/presentation/views/widget/build_profile_info.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final ProfileImagePicker _imagePicker = ProfileImagePicker();
  final ProfileServices _imageService = ProfileServices();

  String? _photoUrl;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _photoUrl = FirebaseAuth.instance.currentUser?.photoURL;
  }

  Future<void> _changeProfileImage() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    try {
      final image = await _imagePicker.pickImage();

      if (image == null || !mounted) return;

      setState(() {
        _isUploading = true;
      });

      final imageUrl = await _imageService.uploadProfileImage(
        image,
        user.uid,
      );

      await user.updatePhotoURL(imageUrl);
      await user.reload();

      if (!mounted) return;

      setState(() {
        _photoUrl = imageUrl;
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile picture updated!')),
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final userName = user?.displayName ??
        user?.email?.split('@').first ??
        'User';

    final userEmail = user?.email ?? 'No email available';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: const Color(0xFF9B7953),
                backgroundImage: _photoUrl != null
                    ? NetworkImage(_photoUrl!)
                    : null,
                child: _photoUrl == null
                    ? const Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.white,
                      )
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _isUploading ? null : _changeProfileImage,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white,
                    child: _isUploading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFF9B7953),
                            ),
                          )
                        : const Icon(
                            Icons.camera_alt,
                            size: 19,
                            color: Color(0xFF9B7953),
                          ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            userEmail,
            style: const TextStyle(color: Colors.grey),
          ),
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
            onTap: () =>ProfileLogoutHelper.logout(context),
          ),
        ],
      ),
    );
  }
}
