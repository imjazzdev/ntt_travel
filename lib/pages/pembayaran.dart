import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ntt_travel/pages/home.dart';

class Pembayaran extends StatelessWidget {
  const Pembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/whatsapp.png',
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Hubungi Admin',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: 'Hubungi?',
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green.shade400,
                    content: Text("Berhasil menghubungi"),
                  ));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (route) => false);
                },
              ).show();
            },
            child: Text('KONFIRMASI')),
      ),
    );
  }
}
