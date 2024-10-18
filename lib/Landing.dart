import 'package:flutter/material.dart';
import 'hotel.dart';
import 'main.dart';
import 'detail.dart'; // Import halaman detail
import 'about.dart';
import 'destination.dart'; // Import halaman about

class Appku extends StatefulWidget {
  const Appku({super.key});

  @override
  State<Appku> createState() => _AppkuState();
}

class _AppkuState extends State<Appku> {
  // Daftar destinasi (Model Data)
  final List<Destination> destinations = [
    Destination(
      name: 'Bali',
      imageUrl:
          'https://akcdn.detik.net.id/community/media/visual/2023/07/19/ilustrasi-pulau-bali_169.jpeg?w=700&q=90',
      description: 'Nikmati keindahan alam dan budaya Bali.',
    ),
    Destination(
      name: 'Paris',
      imageUrl:
          'https://cdn1.sisiplus.co.id/media/sisiplus/asset/uploads/artikel/g2OEbKl2aTEIp1x5hFNYEE9ad615uVenBexDAcVW.jpg',
      description: 'Kota romantis dengan Menara Eiffel yang terkenal.',
    ),
    Destination(
      name: 'New York',
      imageUrl:
          'https://nyc.eu/wp-content/uploads/2015/07/New_York_City-1536x768.jpg',
      description: 'Temukan petualangan di kota yang tak pernah tidur.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mari Travel"),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Jalan jalan bersama"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Appku()));
                },
              ),
              ListTile(
                leading: Icon(Icons.hotel),
                title: Text("Hotel"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Hotel()), // Navigasi ke halaman hotel
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Tentang Aplikasi"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AboutPage())); // Navigasi ke AboutPage
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            final destination = destinations[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(destination: destination),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(destination.imageUrl, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        destination.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
