// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kelas_7ad/widget/sidebar.dart';
import '../../model/cabang.dart';
import '../../service/cabang_service.dart';
import 'cabang_form.dart';
import 'cabang_item.dart';

class CabangPage extends StatefulWidget {
  const CabangPage({super.key});

  @override
  State<CabangPage> createState() => _CabangPageState();
}

class _CabangPageState extends State<CabangPage> {
  Stream<List<Cabang>> getList() async* {
    List<Cabang> data = await CabangService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Cabang"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CabangForm()));
              },
              child: Icon(Icons.add))
        ],
      ),
      drawer: Sidebar(),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return CabangItem(cabang: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
