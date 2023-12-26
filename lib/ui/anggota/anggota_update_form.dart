// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/anggota.dart';
import '../../service/anggota_service.dart';
import 'anggota_detail.dart';

class AnggotaUpdateForm extends StatefulWidget {
  final Anggota anggota;

  const AnggotaUpdateForm({Key? key, required this.anggota}) : super(key: key);
  @override
  _AnggotaUpdateFormState createState() => _AnggotaUpdateFormState();
}

class _AnggotaUpdateFormState extends State<AnggotaUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRMCtrl = TextEditingController();
  final _namaAnggotaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _teleponAnggotaCtrl = TextEditingController();
  final _alamatAnggotaCtrl = TextEditingController();
  Future<Anggota> getData() async {
    Anggota data = await AnggotaService().getById(widget.anggota.id.toString());
    setState(() {
      _namaAnggotaCtrl.text = widget.anggota.namaAnggota;
      _noRMCtrl.text = widget.anggota.nomorRM;
      _tanggalLahirCtrl.text = widget.anggota.tanggalLahir;
      _teleponAnggotaCtrl.text = widget.anggota.nomorTelepon;
      _alamatAnggotaCtrl.text = widget.anggota.alamat;
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
      appBar: AppBar(title: const Text("Ubah Anggota")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNoRM(),
              _fieldNamaAnggota(),
              _fieldTglLahirAnggota(),
              _fieldTeleponAnggota(),
              _fieldAlamatAnggota(),
              _pembatas(),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNoRM() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "NO Anggota",
          hintText: "Input Nomor Anggota"),
      controller: _noRMCtrl,
    );
  }

  _fieldNamaAnggota() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Nama Anggota",
          hintText: "Input Nama Anggota"),
      controller: _namaAnggotaCtrl,
    );
  }

  _fieldTglLahirAnggota() {
    return TextField(
      decoration: const InputDecoration(
        floatingLabelStyle: TextStyle(color: Colors.red),
        labelText: "Tanggal Lahir",
        hintText: "Input Tanggal Lahir",
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

  _fieldAlamatAnggota() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Alamat Anggota",
          hintText: "Input Alamat Anggota"),
      controller: _alamatAnggotaCtrl,
    );
  }

  _fieldTeleponAnggota() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "No Telp Anggota",
          hintText: "Input Nomor Telepon Anggota"),
      controller: _teleponAnggotaCtrl,
    );
  }

  _pembatas() {
    return const SizedBox(height: 20);
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Anggota anggota = Anggota(
              namaAnggota: _namaAnggotaCtrl.text,
              nomorRM: _noRMCtrl.text,
              alamat: _alamatAnggotaCtrl.text,
              nomorTelepon: _teleponAnggotaCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text);
          String id = widget.anggota.id.toString();
          await AnggotaService().ubah(anggota, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AnggotaDetail(anggota: value)));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
