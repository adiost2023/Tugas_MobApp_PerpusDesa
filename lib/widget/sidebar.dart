import 'package:flutter/material.dart';
import 'package:kelas_7ad/helpers/user_info.dart';
import 'package:kelas_7ad/widget/tentang.dart';

import 'HalamanUtama.dart';
import '../ui/login.dart';
import '../ui/pegawai/pegawai_page.dart';
import '../ui/cabang/cabang_page.dart';
import '../ui/anggota/anggota_page.dart';
import '../ui/detbuku/detbuku_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image(image: AssetImage('img/logo1.png')),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Beranda',
              style: TextStyle(
                color: Colors.blue, // Change this line to set the text color to blue
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Beranda()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info_rounded),
            title: const Text(
              'Tentang PerpusApp',
              style: TextStyle(
                color: Colors.blue, // Change this line to set the text color to blue
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const tentang_perpus()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text(
              'Admin',
              style: TextStyle(
                color: Colors.blue, // Change this line to set the text color to blue
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PegawaiPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_membership_rounded),
            title: const Text(
              'Anggota',
              style: TextStyle(
                color: Colors.blue, // Change this line to set the text color to blue
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AnggotaPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_rounded),
            title: const Text(
              'Daftar Buku',
              style: TextStyle(
                color: Colors.blue, // Change this line to set the text color to blue
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DetbukuPage1(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city_rounded),
            title: const Text(
              'Daftar Cabang',
              style: TextStyle(
                color: Colors.blue, // Change this line to set the text color to blue
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CabangPage(),
              ));
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red, // Change this line to set the text color to blue
              ),
            ),
            onTap: () {
              UserInfo().logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
