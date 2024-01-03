import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lapor_book/app/components/styles.dart';
import 'package:lapor_book/app/components/textformfield.dart';
import 'package:lapor_book/app/components/vars.dart';

import '../controllers/tambahlaporan_controller.dart';

class TambahlaporanView extends GetView<TambahlaporanController> {
  const TambahlaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return GetBuilder<TambahlaporanController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQueryHeight * 0.13,
                  width: MediaQueryWidth,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: primaryColor),
                  child: textHeader('Tambah Book'),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      textlaporan('Judul Laporan'),
                      SizedBox(
                        height: 8,
                      ),
                      TextformfielAuth(
                        controller: controller.JudulLaporanCtrl,
                        validator: (value) {
                          return controller.validateJudul(value!);
                        },
                        onChanged: (value) {
                          return controller.JudulLaporanCtrl.text = value;
                        },
                        enable: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textlaporan('Foto Pendukung'),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.photo_camera),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textlaporan('Instansi'),
                      SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Pilih Instansi',
                        ),
                        items: dataInstansi.map((e) {
                          return DropdownMenuItem<String>(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (selected) {
                          controller.instansi.value = selected!;
                        },
                        value: null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textlaporan('Deskripsi'),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(24),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQueryWidth,
                            MediaQueryHeight * 0.05,
                          ),
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Kirim Laporan',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
