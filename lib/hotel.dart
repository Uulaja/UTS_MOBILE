import 'package:flutter/material.dart';
import 'hotelmodel.dart';  // Import model hotel
import 'hoteldetail.dart';  // Import halaman detail hotel

class Hotel extends StatelessWidget {
  // List data hotel menggunakan model HotelModel
  final List<HotelModel> hotels = [
    HotelModel(
      name: "Hotel Bali Resort",
      imageUrl: "https://bali.intercontinental.com/wp-content/uploads/2024/08/Bali-Savings-Deal--1440x1018.jpg",
      description: "Penginapan nyaman di Bali dengan pemandangan pantai.",
    ),
    HotelModel(
      name: "Paris Luxury Suites",
      imageUrl: "https://static.prod.r53.tablethotels.com/media/ecs/global/michelin-articles/Paris+Guide+Images/Luxurious+Hotels/Peninsula.jpg",
      description: "Hotel mewah di pusat kota Paris dengan fasilitas lengkap.",
    ),
    HotelModel(
      name: "New York Grand Hotel",
      imageUrl: "https://en.wikipedia.org/wiki/File:Grand_Hotel_1232-38_Broadway.jpg",
      description: "Nikmati kemewahan dan kemudahan akses ke seluruh kota New York.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rekomendasi Hotel"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu Hotel"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.pushNamed(context, '/'); // Kembali ke halaman Home
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text("Destinasi"),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.pushNamed(context, '/explore'); // Navigasi ke halaman destinasi
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelDetailPage(hotel: hotel),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    hotel.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Icon(Icons.broken_image, size: 200); // Jika gambar tidak dapat di-load
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hotel.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hotel.description,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
