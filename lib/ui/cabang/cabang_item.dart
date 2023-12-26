import 'package:flutter/material.dart';
import '../../model/cabang.dart';
import 'cabang_detail.dart';

class CabangItem extends StatelessWidget {
  final Cabang cabang;
  const CabangItem({super.key, required this.cabang});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(cabang.namaCabang),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CabangDetail(cabang: cabang)));
      },
    );
  }
}
