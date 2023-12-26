import 'package:flutter/material.dart';
import '../widget/sidebar.dart';



class tentang_perpus extends StatefulWidget {
  const tentang_perpus({super.key});

  @override
  State<tentang_perpus> createState() => _tentang_perpusState();
}

class _tentang_perpusState extends State<tentang_perpus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Visi & Misi"),

      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Visi')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),

          ),
          Container(
            height: 100,
            color: Colors.amber[500],
            child: const Center(child: Text('Menjadi pusat pengetahuan dan budaya yang memberdayakan masyarakat desa melalui akses informasi, literasi, dan pembelajaran sepanjang hayat."')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),

          ),
          Container(
            height: 50,
            color: Colors.amber[50],
            child: const Center(child: Text('Misi')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Memberikan akses informasi yang mudah dan merata kepada seluruh masyarakat desa agar dapat meningkatkan pengetahuan dan pemahaman mereka.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Mendorong minat baca dan literasi di kalangan masyarakat desa melalui program-program yang menarik dan inovatif.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Menyediakan koleksi buku yang relevan, berkualitas, dan bervariasi untuk semua kelompok usia dan minat.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Mengadakan kegiatan pembelajaran dan pelatihan yang mendukung pengembangan keterampilan dan pengetahuan masyarakat desa.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Membangun kemitraan dengan lembaga pendidikan, organisasi masyarakat, dan pihak lain untuk memperluas layanan dan menciptakan sinergi dalam meningkatkan literasi masyarakat desa.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Menyediakan ruang yang nyaman dan kondusif untuk membaca, belajar, dan berbagi pengetahuan.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Mempromosikan budaya lokal melalui pengenalan dan pelestarian warisan lokal melalui kegiatan budaya dan seni di perpustakaan desa.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Mengintegrasikan teknologi informasi dan komunikasi untuk meningkatkan layanan perpustakaan dan aksesibilitas informasi bagi masyarakat desa.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Melibatkan komunitas dalam pengelolaan perpustakaan dan menyelenggarakan program-partisipatif yang melibatkan masyarakat dalam pengambilan keputusan dan pengembangan perpustakaan.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Terus berinovasi dan beradaptasi dengan perkembangan teknologi dan kebutuhan masyarakat desa untuk menjaga relevansi dan keberlanjutan perpustakaan desa. Perpustakaan desa dengan visi dan misi seperti di atas bertujuan untuk menciptakan masyarakat desa yang terdidik, berpengetahuan, dan berbudaya.')),
          ),
          Container(
            height: 10,
            color: Colors.amber[5],
            child: const Center(child: Text('')),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: const Center(child: Text('Dengan akses yang mudah terhadap informasi dan sumber daya, perpustakaan desa dapat menjadi pusat pembelajaran dan perkembangan masyarakat desa yang inklusif dan berkelanjutan.')),
          ),

        ],
      ),
    );
  }
}