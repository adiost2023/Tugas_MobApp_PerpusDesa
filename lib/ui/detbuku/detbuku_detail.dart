import 'package:flutter/material.dart';
import '../../service/detbuku_service.dart';
import '../../model/detbuku.dart';
import '../../widget/sidebar.dart';
import 'detbuku_page.dart';
import 'detbuku_update_form.dart';

class DetbukuDetail1 extends StatefulWidget {
  final Detbuku buku;

  const DetbukuDetail1({super.key, required this.buku});

  @override
  State<DetbukuDetail1> createState() => _DetbukuDetail1State();
}

class _DetbukuDetail1State extends State<DetbukuDetail1> {
  Stream<Detbuku> getData() async* {
    Detbuku data = await DetbukuService1().getById(widget.buku.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Buku")),
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
                  title: const Text("Nomor Buku"),
                  subtitle: Text(snapshot.data.nomorRM,
                      style: const TextStyle(fontSize: 20))),
              ListTile(
                  title: const Text("Nama Buku"),
                  subtitle: Text(snapshot.data.namaDetbuku,
                      style: const TextStyle(fontSize: 20))),
              ListTile(
                  title: const Text("Tanggal Input"),
                  subtitle: Text(snapshot.data.tanggalLahir,
                      style: const TextStyle(fontSize: 20))),
              ListTile(
                  title: const Text("Nomor ISBN"),
                  subtitle: Text(snapshot.data.nomorTelepon,
                      style: const TextStyle(fontSize: 20))),
              ListTile(
                  title: const Text("Pengarang"),
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
                          DetbukuUpdateForm1(buku: snapshot.data)));
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
                        builder: (context) => const DetbukuPage1(),
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
    await DetbukuService1().hapus(data);
    await Future.delayed(Duration.zero);
    if (!context.mounted) return;
    Navigator.of(context).pop(); // Close the confirmation dialog
  }
}
