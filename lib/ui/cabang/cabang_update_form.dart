import 'package:flutter/material.dart';
import 'package:kelas_7ad/ui/cabang/cabang_detail.dart';

import '../../model/cabang.dart';
import '../../service/cabang_service.dart';

class CabangUpdateForm extends StatefulWidget {
  final Cabang cabang;
  const CabangUpdateForm({Key? key, required this.cabang}) : super(key: key);

  @override
  State<CabangUpdateForm> createState() => _CabangUpdateFormState();
}

class _CabangUpdateFormState extends State<CabangUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCabangCtrl = TextEditingController();
  Future<Cabang> getData() async {
    Cabang data = await CabangService().getById(widget.cabang.id.toString());
    setState(() {
      _namaCabangCtrl.text = data.namaCabang;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Update Cabang"),
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
      // //readOnly: true,
      // enabled: false,
    );
  }

  _pembatas() {
    return const SizedBox(height: 20);
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Cabang cabang = Cabang(namaCabang: _namaCabangCtrl.text);
          String id = widget.cabang.id.toString();
          await CabangService().ubah(cabang, id).then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CabangDetail(cabang: value)));
          });
        },
        child: const Text("Simpan"));
  }
}
