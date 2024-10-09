import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Aksi saat ikon settings ditekan
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Gambar profil

            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/sohe.jpg'),
              ),
            ),
            const SizedBox(height: 20.0),

            // Nama dan email pengguna
            const Text(
              'gntrwsnu',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'tastore1@gmail.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30.0),

            // Tombol navigasi
            Expanded(
              child: ListView(
                children: [
                  ProfileOption(
                    icon: Icons.favorite_border,
                    text: 'My Favorites',
                    onTap: () {
                      // Aksi saat menu favorit ditekan
                    },
                  ),
                  ProfileOption(
                    icon: Icons.shopping_cart_outlined,
                    text: 'Order Booking',
                    onTap: () {
                      // Aksi saat menu riwayat pembelian ditekan
                    },
                  ),
                  ProfileOption(
                    icon: Icons.location_on_outlined,
                    text: 'My Address',
                    onTap: () {
                      // Aksi saat menu alamat ditekan
                    },
                  ),
                  ProfileOption(
                    icon: Icons.help_outline,
                    text: 'Help Center',
                    onTap: () {
                      // Aksi saat menu bantuan ditekan
                    },
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    text: 'Log Out',
                    onTap: () {
                      // Aksi saat logout ditekan
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk item menu di halaman profil
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileOption({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 20.0),
            Text(
              text,
              style: const TextStyle(fontSize: 16.0),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
