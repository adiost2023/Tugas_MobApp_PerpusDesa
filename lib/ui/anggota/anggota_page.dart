import 'package:flutter/material.dart';
import '../../model/anggota.dart';
import '../../service/anggota_service.dart';
import 'anggota_form.dart';
import 'anggota_item.dart';
import '../../widget/sidebar.dart';

class AnggotaPage extends StatefulWidget {
  const AnggotaPage({super.key});

  @override
  State<AnggotaPage> createState() => _AnggotaPageState();
}

class _AnggotaPageState extends State<AnggotaPage> {
  Stream<List<Anggota>> getList() async* {
    List<Anggota> data = await AnggotaService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Anggota"),
        actions: [
          ElevatedButton(
            child: const Text("Tambah Data"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AnggotaForm()));
            },
          )
        ],
      ),
      drawer: const Sidebar(),
      body: StreamBuilder(
        stream: getList(),
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
            return const Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return AnggotaItem(anggota: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}