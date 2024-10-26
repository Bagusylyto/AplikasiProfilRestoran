import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'RM. Sedap Rasa';
    biodata['email'] = 'byuliyanto1@gmail.com';
    biodata['phone'] = '+628989339691';
    biodata['image'] = 'ProfilSedapRasa.jpeg';
    biodata['menu1'] = 'Ayam Goreng';
    biodata['menu2'] = 'Bebek Goreng';
    biodata['menu3'] = 'Lele Goreng';
    biodata['jam1'] = '11.00 - 21.00';
    biodata['jam2'] = '10.00 - 22.00';
    biodata['addr'] =
        'Jl. Bulustalan 4 No.407 Semarang Selatan Kota Semarang Jawa Tengah';
    biodata['desc'] =
        "'Restoran Sedap Rasa menghadirkan cita rasa autentik dengan menu pilihan khas Nusantara. Menggunakan bahan segar dan rempah pilihan, setiap hidangan diolah dengan penuh cinta dan keahlian. Nikmati pengalaman bersantap yang lezat, nyaman, dan menggugah selera hanya di Sedap Rasa!.'";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Restoran",
      home: Scaffold(
        appBar: AppBar(
          title: Text("RM. Sedap Rasa"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // textKotak(Colors.black, biodata["name"] ?? ''),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 10),
              Row(
                children: [
                  btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                      "mailto:${biodata["email"]}"),
                  btnContact(Icons.phone, Colors.deepPurple,
                      "tel:${biodata['phone']}"),
                  btnContact(Icons.maps_home_work_rounded, Colors.green[900],
                      "https://www.google.com/maps?q=Kos+Putra+No+407"),
                ],
              ),
              SizedBox(height: 10),
              // textAttribute("Hooby", biodata['hobby'] ?? ''),
              // textAttribute("Alamat", biodata['addr'] ?? ''),
              textKotak(Colors.black38, "Deskripsi :"),
              SizedBox(height: 10),
              Text(
                biodata["desc"] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              textKotak(Colors.black38, "List Menu :"),
              textAttribute("", biodata['menu1'] ?? ''),
              textAttribute("", biodata['menu2'] ?? ''),
              textAttribute("", biodata['menu3'] ?? ''),
              SizedBox(height: 10),
              textKotak(Colors.black38, "Alamat :"),
              Text(
                biodata["addr"] ?? '',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              textKotak(Colors.black38, "Jam Buka :"),
              textAttribute("Senin - Jumat :", biodata['jam1'] ?? ''),
              textAttribute("Sabtu & Minggu :", biodata['jam2'] ?? ''),
            ],
          ),
        ),
      ),
    );
  }

  Container textKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          child: Text(
            '- $judul ',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Text(
          teks,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
