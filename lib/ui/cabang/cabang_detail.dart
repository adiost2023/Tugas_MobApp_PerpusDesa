import 'package:flutter/material.dart';
import 'package:kelas_7ad/ui/cabang/cabang_update_form.dart';
import 'package:kelas_7ad/widget/sidebar.dart';
import '../../model/cabang.dart';
import '../../service/cabang_service.dart';
import 'cabang_page.dart';

class CabangDetail extends StatefulWidget {
  final Cabang cabang;
  const CabangDetail({Key? key, required this.cabang}) : super(key: key);
  @override
  _CabangDetailState createState() => _CabangDetailState();
}

class _CabangDetailState extends State<CabangDetail> {
  Stream<Cabang> getData() async* {
    Cabang data = await CabangService().getById(widget.cabang.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Cabang")),
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
            children: [
              const SizedBox(height: 20),
              Text(
                "Nama Cabang : ${snapshot.data.namaCabang}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(), _tombolHapus()],
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
                          CabangUpdateForm(cabang: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Ubah")));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                        onPressed: () async {
                          await CabangService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CabangPage()));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text("YA"),
                      )),
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
}
