import 'package:flutter/material.dart';
import 'package:kelas_7ad/ui/anggota/anggota_page.dart';
import '../model/anggota.dart';
import '../model/cabang.dart';
import '../model/detbuku.dart';
import '../service/anggota_service.dart';
import '../service/pegawai_service.dart';
import '../service/detbuku_service.dart';
import '../model/pegawai.dart';
import '../service/cabang_service.dart';
import '../ui/anggota/anggota_page.dart';
import '../ui/pegawai/pegawai_page.dart';
import '../ui/cabang/cabang_page.dart';
import '../ui/detbuku/detbuku_page.dart';
import 'sidebar.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<Pegawai> totaluser = []; //admin
  List<Anggota> totalanggota = []; //anggota
  List<Cabang> totalcabang = []; //cabang
  List<Detbuku> totalbuku = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final List<Pegawai> fetchedUsers = await PegawaiService().listData();
    final List<Anggota> fetchedAnggota = await AnggotaService().listData();
    final List<Cabang> fetchedCabang = await CabangService().listData();
    final List<Detbuku> fetchedDetbuku = await DetbukuService1().listData();
    setState(() {
      totaluser = fetchedUsers;
      totalanggota = fetchedAnggota;
      totalcabang = fetchedCabang;
      totalbuku = fetchedDetbuku;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard PerpusApp"),
      ),
      body:
          //  Column(children: [
          //   Text(
          //     "Data Klinik",
          //     style:
          //         Theme.of(context).textTheme.headlineMedium, // like <h1> in HTML
          //   ),
          GridView.count(
        crossAxisCount: 2,
        children: [
          DashboardCard(
            title: 'Total Cabang',
            value: totalcabang.length.toString(),
            icon: Icons.location_city_rounded,
            color: Colors.blue,
          ),
          DashboardCard(
            title: 'Total Anggota',
            value: totalanggota.length.toString(),
            icon: Icons.card_membership_rounded,
            color: Colors.orange,
          ),
          DashboardCard(
            title: 'Total Pegawai',
            value: totaluser.length.toString(),
            icon: Icons.person,
            color: Colors.green,
          ),
          DashboardCard(
            title: 'Total Buku',
            value: totalbuku.length.toString(),
            icon: Icons.book_rounded,
            color: Colors.green,
          ),
          // DashboardCard(
          //   title: 'Messages',
          //   value: '10',
          //   icon: Icons.message,
          //   color: Colors.red,
          // ),
          // Add more DashboardCard widgets as needed
        ],
      ),
      // ]),
      drawer: const Sidebar(),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  void navigateToPage(BuildContext context) {
    switch (title) {
      case 'Total Cabang':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CabangPage(),
        ));
        break;
      case 'Total Anggota':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AnggotaPage(),
        ));
        break;
      case 'Total Pegawai':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PegawaiPage(),
        ));
        break;
      case 'Total Buku':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const DetbukuPage1(),
        ));
        break;
      // Add more cases for other cards if needed
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPage(context),
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(12),
        child: ListTile(
          leading: Icon(
            icon,
            size: 40,
            color: color,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
