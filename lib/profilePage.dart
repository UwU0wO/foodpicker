import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF7),
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,

        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=13', // Replace with asset if needed
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Liam',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Foodie since 2018',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            _buildSectionHeader('Account'),
            _buildListTile(
              Icons.email_outlined,
              'Email',
              'sophia.clark@email.com',
            ),
            _buildListTile(Icons.phone_outlined, 'Phone', '+1 (555) 123-4567'),

            const SizedBox(height: 16),
            _buildSectionHeader('Preferences'),
            _buildListTile(
              Icons.no_food_outlined,
              'Dietary Restrictions',
              'Spicy, Vegetarian',
            ),
            _buildListTile(
              Icons.restaurant_menu_outlined,
              'Favorite Cuisines',
              'Italian, Mexican',
            ),

            const SizedBox(height: 16),
            _buildSectionHeader('Orders'),
            _buildListTile(Icons.history_outlined, 'Past Orders', '5 Orders'),

            const SizedBox(height: 16),
            _buildSectionHeader('Settings'),
            _buildListTile(Icons.notifications_outlined, 'Notifications', ''),
            _buildListTile(Icons.payment_outlined, 'Payment Methods', ''),
            _buildListTile(Icons.help_outline, 'Help & Support', ''),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.deepOrange),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle, style: const TextStyle(color: Colors.black54))
          : null,
      onTap: () {
        // Add action if needed
      },
    );
  }
}
