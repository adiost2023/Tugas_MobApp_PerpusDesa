import 'package:flutter/material.dart';
import 'package:kelas_7ad/ui/cabang/cabang_detail.dart';

import '../../model/cabang.dart';
import '../../service/cabang_service.dart';

class CabangForm extends StatefulWidget {
  const CabangForm({Key? key}) : super(key: key);

  @override
  State<CabangForm> createState() => _CabangFormState();
}

class _CabangFormState extends State<CabangForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCabangCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Cabang"),
      ),
      body: SingleChildScrollView(
        key: _formKey,
        child: Form(
            child: Column(
          children: [_fieldNamaCabang(), _pembatas(), _tombolSimpan()],
        )),
      ),
    );
  }

  _fieldNamaCabang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Cabang"),
      controller: _namaCabangCtrl,
    );
  }

  _pembatas() {
    return const SizedBox(height: 20);
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Cabang cabang = Cabang(namaCabang: _namaCabangCtrl.text);
          await CabangService().simpan(cabang).then((value) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => CabangDetail(cabang: value)));
          });
        },
        child: const Text("Simpan"));
  }
}
