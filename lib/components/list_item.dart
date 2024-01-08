// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lapor_book/components/styles.dart';
import 'package:lapor_book/models/akun.dart';
import 'package:lapor_book/models/laporan.dart';

class ListItem extends StatefulWidget {
  final Laporan laporan;
  final Akun akun;
  final bool isLaporanku;
  const ListItem(
      {super.key,
      required this.laporan,
      required this.akun,
      required this.isLaporanku});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  void deleteLaporan() async {
    try {
      await _firestore.collection('laporan').doc(widget.laporan.docId).delete();

      // menghapus gambar dari storage
      if (widget.laporan.gambar != '') {
        await _storage.refFromURL(widget.laporan.gambar!).delete();
      }
      Navigator.pop(context);
      Navigator.popAndPushNamed(context, '/dashboard');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: {
            'laporan': widget.laporan,
            'akun': widget.akun,
          });
        },
        onLongPress: () {
          if (widget.isLaporanku) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete ${widget.laporan.judul}?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          deleteLaporan();
                        },
                        child: const Text('Hapus'),
                      ),
                    ],
                  );
                });
          }
        },
        child: Column(
          children: [
            widget.laporan.gambar != ''
                ? Image.network(
                    widget.laporan.gambar!,
                    width: 130,
                    height: 130,
                  )
                : Image.asset(
                    'assets/no_image_placeholder.png',
                    width: 130,
                    height: 130,
                  ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(width: 2))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.laporan.judul,
                  style: headerStyle(
                    level: 4,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: widget.laporan.status == 'Posted'
                              ? warningColor
                              : widget.laporan.status == 'On Process'
                                  ? Colors.green
                                  : widget.laporan.status == 'Done'
                                      ? Colors.blue
                                      : dangerColor,
                          // borderRadius: const BorderRadius.only(
                          //   bottomLeft: Radius.circular(5),
                          // ),
                          border: const Border.symmetric(
                              vertical: BorderSide(width: 1))),
                      alignment: Alignment.center,
                      child: Text(
                        widget.laporan.status,
                        style: headerStyle(level: 5, dark: false),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          // borderRadius: const BorderRadius.only(
                          //     bottomRight: Radius.circular(5)),
                          border: const Border.symmetric(
                              vertical: BorderSide(width: 1))),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.laporan.like.toString(),
                            style: headerStyle(level: 5, dark: false),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
