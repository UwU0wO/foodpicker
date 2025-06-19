import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF7),
      appBar: AppBar(
        title: const Text('Reward'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
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
            const Text('Level 3', style: TextStyle(color: Colors.grey)),
            const Text(
              '1200 points',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Daily Challenges'),
            _buildChallengeTile(
              Icons.edit,
              'Try a new cuisine',
              'Earn 50 points',
            ),
            _buildChallengeTile(
              Icons.location_on_outlined,
              'Visit a new restaurant',
              'Earn 30 points',
            ),
            _buildChallengeTile(
              Icons.camera_alt_outlined,
              'Share a food photo',
              'Earn 20 points',
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('Mini–Games'),
            _buildChallengeTile(
              Icons.quiz_outlined,
              'Food Trivia',
              'Earn up to 100 points',
            ),
            _buildChallengeTile(
              Icons.restaurant_menu_outlined,
              'Recipe Match',
              'Earn up to 50 points',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildChallengeTile(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: Colors.deepOrange),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.deepOrange),
      ),
      onTap: () {
        // Add challenge/game action if needed
      },
    );
  }
}
