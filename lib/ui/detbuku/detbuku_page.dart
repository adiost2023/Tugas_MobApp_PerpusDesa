import 'package:flutter/material.dart';
import '../../model/detbuku.dart';
import '../../service/detbuku_service.dart';
import 'detbuku_form.dart';
import 'detbuku_item.dart';
import '../../widget/sidebar.dart';

class DetbukuPage1 extends StatefulWidget {
  const DetbukuPage1({super.key});

  @override
  State<DetbukuPage1> createState() => _DetbukuPage1State();
}

class _DetbukuPage1State extends State<DetbukuPage1> {
  Stream<List<Detbuku>> getList() async* {
    List<Detbuku> data = await DetbukuService1().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Buku"),
        actions: [
          ElevatedButton(
            child: const Text("Tambah Data Buku"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DetbukuForm1()));
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
              return DetbukuItem1(buku: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}