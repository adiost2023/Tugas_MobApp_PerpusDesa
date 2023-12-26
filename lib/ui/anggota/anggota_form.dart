import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/anggota.dart';
import 'anggota_detail.dart';

import '../../service/anggota_service.dart';

class AnggotaForm extends StatefulWidget {
  const AnggotaForm({Key? key}) : super(key: key);

  @override
  State<AnggotaForm> createState() => _AnggotaFormState();
}

class _AnggotaFormState extends State<AnggotaForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRMCtrl = TextEditingController();
  final _namaAnggotaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _teleponAnggotaCtrl = TextEditingController();
  final _alamatAnggotaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tambah Anggota")),
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
        ));
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
          await AnggotaService().simpan(anggota).then((value) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AnggotaDetail(anggota: value)));
          });
        },
        child: const Text("Simpan"));
  }
}
