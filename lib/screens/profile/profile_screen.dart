import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../data/mock_data.dart';
import '../../models/course.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedTab = 'About Me';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Red Header Background
                Container(
                  height: 310,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Profile Image
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'MOCH ASHROFUL MALIK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 60), // Space for floating card
                        ],
                      ),
                    ),
                  ),
                ),
                // Floating Tab Card
                Positioned(
                  bottom: -30,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTabItem(title: 'About Me', isActive: _selectedTab == 'About Me'),
                        _buildTabItem(title: 'Kelas', isActive: _selectedTab == 'Kelas'),
                        _buildTabItem(title: 'Edit Profile', isActive: _selectedTab == 'Edit Profile'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            // Dynamic Content Section
            if (_selectedTab == 'About Me') _buildAboutMeSection(),
            if (_selectedTab == 'Kelas') _buildClassesSection(),
            if (_selectedTab == 'Edit Profile') _buildEditProfileSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
         height: 70,
         decoration: const BoxDecoration(
           color: AppColors.primary,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(30),
             topRight: Radius.circular(30),
           )
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             _buildBottomNavItem(icon: Icons.home, label: 'Home', isActive: false),
             _buildBottomNavItem(icon: Icons.school, label: 'Kelas Saya', isActive: false),
             _buildBottomNavItem(icon: Icons.notifications, label: 'Notifikasi', isActive: false),
           ],
         ),
      ),
    );
  }

  Widget _buildTabItem({required String title, required bool isActive}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              color: Colors.black,
            ),
        ],
      ),
    );
  }

  Widget _buildAboutMeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi User',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            label: 'Email address',
            value: 'mochashroful@gmail.com',
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            label: 'Program Studi',
            value: 'S1 Teknik Informatika',
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            label: 'Fakultas',
            value: 'TEKNIK',
          ),
          const SizedBox(height: 32),
          const Text(
            'Aktivitas Login',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            label: 'First access to site',
            value: 'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)',
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            label: 'Last access to site',
            value: 'Tuesday, 22 June 2021, 9:44 PM (now)',
          ),
        ],
      ),
    );
  }

  Widget _buildClassesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: MockData.courses.map((course) => _buildClassItem(course)).toList(),
      ),
    );
  }

  Widget _buildEditProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildTextField(label: 'Nama Pertama'),
          const SizedBox(height: 16),
          _buildTextField(label: 'Nama Terakhir'),
          const SizedBox(height: 16),
          _buildTextField(label: 'E-mail Address'),
          const SizedBox(height: 16),
          _buildTextField(label: 'Negara'),
          const SizedBox(height: 16),
           _buildTextField(label: 'Deskripsi'),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black, 
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
             enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClassItem(Course course) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF8DBCE8), // Light Blue color from image
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${course.code} ${course.section}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                if (course.startDate != null)
                   Text(
                    'Tanggal Mulai ${course.startDate}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black, 
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavItem({required IconData icon, required String label, required bool isActive}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        Text(
           label,
           style: const TextStyle(color: Colors.white, fontSize: 10)
        )
      ],
    );
  }
}
