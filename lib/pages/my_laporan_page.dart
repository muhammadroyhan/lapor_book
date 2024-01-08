// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lapor_book/components/list_item.dart';
import 'package:lapor_book/models/akun.dart';
import 'package:lapor_book/models/laporan.dart';

class MyLaporan extends StatefulWidget {
  final Akun akun;
  const MyLaporan({super.key, required this.akun});

  @override
  State<MyLaporan> createState() => _MyLaporanState();
}

class _MyLaporanState extends State<MyLaporan> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  List<Laporan> listLaporan = [];

  void getTransaksi() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('laporan')
          .where('uid', isEqualTo: _auth.currentUser!.uid)
          .get();

      setState(() {
        listLaporan.clear();
        for (var documents in querySnapshot.docs) {
          List<dynamic>? komentarData = documents.data()['komentar'];

          List<Komentar>? listKomentar = komentarData?.map((map) {
            return Komentar(
              nama: map['nama'],
              isi: map['isi'],
            );
          }).toList();
          listLaporan.add(
            Laporan(
              uid: documents.data()['uid'],
              docId: documents.data()['docId'],
              judul: documents.data()['judul'],
              instansi: documents.data()['instansi'],
              deskripsi: documents.data()['deskripsi'],
              nama: documents.data()['nama'],
              status: documents.data()['status'],
              gambar: documents.data()['gambar'],
              tanggal: documents['tanggal'].toDate(),
              maps: documents.data()['maps'],
              like: documents.data()['like'],
              komentar: listKomentar,
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getTransaksi();

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 8,
          top: 8,
        ),
        width: double.infinity,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.234,
            ),
            itemCount: listLaporan.length,
            itemBuilder: (context, index) {
              return ListItem(
                laporan: listLaporan[index],
                akun: widget.akun,
                isLaporanku: true,
              );
            }),
      ),
    );
  }
}
