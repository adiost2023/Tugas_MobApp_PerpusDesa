import 'package:flutter/material.dart';
import '../../model/detbuku.dart';
import 'detbuku_detail.dart';

class DetbukuItem1 extends StatelessWidget {
  final Detbuku buku;
  const DetbukuItem1({super.key, required this.buku});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetbukuDetail1(buku: buku)));
      },
      child: Card(
        child: ListTile(
          title: Text(buku.namaDetbuku),
        ),
      ),
    );
  }
}



