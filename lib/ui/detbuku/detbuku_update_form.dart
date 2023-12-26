// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/detbuku.dart';
import '../../service/detbuku_service.dart';
import 'detbuku_detail.dart';

class DetbukuUpdateForm1 extends StatefulWidget {
  final Detbuku buku;

  const DetbukuUpdateForm1({Key? key, required this.buku}) : super(key: key);
  @override
  _DetbukuUpdateForm1State createState() => _DetbukuUpdateForm1State();
}

class _DetbukuUpdateForm1State extends State<DetbukuUpdateForm1> {
  final _formKey = GlobalKey<FormState>();
  final _noRMCtrl = TextEditingController();
  final _namaDetbukuCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _teleponDetbukuCtrl = TextEditingController();
  final _alamatDetbukuCtrl = TextEditingController();
  Future<Detbuku> getData() async {
    Detbuku data = await DetbukuService1().getById(widget.buku.id.toString());
    setState(() {
      _namaDetbukuCtrl.text = widget.buku.namaDetbuku;
      _noRMCtrl.text = widget.buku.nomorRM;
      _tanggalLahirCtrl.text = widget.buku.tanggalLahir;
      _teleponDetbukuCtrl.text = widget.buku.nomorTelepon;
      _alamatDetbukuCtrl.text = widget.buku.alamat;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Buku")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNoRM1(),
              _fieldNamaDetbuku1(),
              _fieldTglLahirDetbuku1(),
              _fieldTeleponDetbuku1(),
              _fieldAlamatDetbuku1(),
              _pembatas1(),
              _tombolSimpan1()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNoRM1() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "NO Buku",
          hintText: "Input Nomor Buku"),
      controller: _noRMCtrl,
    );
  }

  _fieldNamaDetbuku1() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Nama Buku",
          hintText: "Input Nama Buku"),
      controller: _namaDetbukuCtrl,
    );
  }

  _fieldTglLahirDetbuku1() {
    return TextField(
      decoration: const InputDecoration(
        floatingLabelStyle: TextStyle(color: Colors.red),
        labelText: "Tanggal Input",
        hintText: "Input Tanggal Buku Masuk",
        icon: Icon(Icons.calendar_today),
      ),
      controller: _tanggalLahirCtrl,

      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                1990), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

          _tanggalLahirCtrl.text =
              formattedDate; //set output date to TextField value.
        }
      },
    );
  }

  _fieldAlamatDetbuku1() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Pengarang Buku",
          hintText: "Input Pengarang"),
      controller: _alamatDetbukuCtrl,
    );
  }

  _fieldTeleponDetbuku1() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "No ISBN",
          hintText: "Input ISBN"),
      controller: _teleponDetbukuCtrl,
    );
  }

  _pembatas1() {
    return const SizedBox(height: 20);
  }

  _tombolSimpan1() {
    return ElevatedButton(
        onPressed: () async {
          Detbuku buku = Detbuku(
              namaDetbuku: _namaDetbukuCtrl.text,
              nomorRM: _noRMCtrl.text,
              alamat: _alamatDetbukuCtrl.text,
              nomorTelepon: _teleponDetbukuCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text);
          String id = widget.buku.id.toString();
          await DetbukuService1().ubah(buku, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => DetbukuDetail1(buku: value)));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
