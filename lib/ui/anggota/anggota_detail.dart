import 'package:flutter/material.dart';
import '../../service/anggota_service.dart';
import '../../model/anggota.dart';
import '../../widget/sidebar.dart';
import 'anggota_page.dart';
import 'anggota_update_form.dart';

class AnggotaDetail extends StatefulWidget {
  final Anggota anggota;

  const AnggotaDetail({super.key, required this.anggota});

  @override
  State<AnggotaDetail> createState() => _AnggotaDetailState();
}

class _AnggotaDetailState extends State<AnggotaDetail> {
  Stream<Anggota> getData() async* {
    Anggota data = await AnggotaService().getById(widget.anggota.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anggota Detail")),
      drawer: const Sidebar(),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return const Text('Data Tidak Ditemukan');
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ListTile(
                  title: const Text("Nomor Anggota"),
                  subtitle: Text(snapshot.data.nomorRM,
                      style: const TextStyle(fontSize: 20))),
              ListTile(
                  title: const Text("Nama Anggota"),
                  subtitle: Text(snapshot.data.namaAnggota,
                      style: const TextStyle(fontSize: 20))),
              ListTile(
                  title: const Text("Tanggal Lahir"),
                  subtitle: Text(snapshot.data.tanggalLahir,
                      style: const TextStyle(fontSize: 20))),
              ListTile(
                  title: const Text("Nomor Telepon"),
                  subtitle: Text(snapshot.data.nomorTelepon,
                      style: const TextStyle(fontSize: 20))),
              ListTile(
                  title: const Text("Alamat"),
                  subtitle: Text(snapshot.data.alamat,
                      style: const TextStyle(fontSize: 20))),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _tombolUbah(),
                  _tombolHapus(),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AnggotaUpdateForm(anggota: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Ubah")));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () async {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              // tombol ya
              StreamBuilder(
                stream: getData(),
                builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Close the confirmation dialog
                    _hapusData(snapshot.data);
                    // Call the _hapusData function
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnggotaPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("YA"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Tidak"),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus"));
  }

// Function to handle data deletion and navigation
  _hapusData(data) async {
    await AnggotaService().hapus(data);
    await Future.delayed(Duration.zero);
    if (!context.mounted) return;
    Navigator.of(context).pop(); // Close the confirmation dialog
  }
}
