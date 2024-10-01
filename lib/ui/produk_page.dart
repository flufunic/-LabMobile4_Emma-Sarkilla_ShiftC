import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk Emma'),
        backgroundColor:
            const Color.fromARGB(255, 206, 110, 240), // Lilac color
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProdukForm()));
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 67, 255), // Lilac color
              ),
              child: const Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Logout', style: TextStyle(fontSize: 18)),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                // Tambahkan logika logout di sini
              },
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ItemProduk(
              produk: Produk(
                  id: 1,
                  kodeProduk: 'A001',
                  namaProduk: 'Kamera',
                  hargaProduk: 5000000)),
          ItemProduk(
              produk: Produk(
                  id: 2,
                  kodeProduk: 'A002',
                  namaProduk: 'Kulkas',
                  hargaProduk: 2500000)),
          ItemProduk(
              produk: Produk(
                  id: 3,
                  kodeProduk: 'A003',
                  namaProduk: 'Mesin Cuci',
                  hargaProduk: 2000000)),
        ],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(produk: produk)));
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Placeholder untuk gambar produk
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
              const SizedBox(width: 15),
              // Detail produk
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produk.namaProduk!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Rp ${produk.hargaProduk}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
