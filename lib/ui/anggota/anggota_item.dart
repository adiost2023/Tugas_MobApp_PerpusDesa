import 'package:flutter/material.dart';
import '../../model/anggota.dart';
import 'anggota_detail.dart';

class AnggotaItem extends StatelessWidget {
  final Anggota anggota;
  const AnggotaItem({super.key, required this.anggota});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AnggotaDetail(anggota: anggota)));
      },
      child: Card(
        child: ListTile(
          title: Text(anggota.namaAnggota),
        ),
      ),
    );
  }
}
