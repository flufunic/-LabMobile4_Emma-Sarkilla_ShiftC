import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';

class ProdukForm extends StatefulWidget {
  Produk? produk;

  ProdukForm({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH PRODUK";
  String tombolSubmit = "SIMPAN";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK";
        tombolSubmit = "UBAH";
        _kodeProdukTextboxController.text = widget.produk!.kodeProduk!;
        _namaProdukTextboxController.text = widget.produk!.namaProduk!;
        _hargaProdukTextboxController.text =
            widget.produk!.hargaProduk.toString();
      });
    } else {
      judul = "TAMBAH PRODUK EMMA";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
        backgroundColor: const Color.fromARGB(255, 206, 110, 240),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding yang lebih besar
          child: Card(
            // Menambahkan Card untuk membungkus form
            elevation: 4, // Menambahkan bayangan pada Card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Sudut melengkung
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0), // Padding di dalam Card
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _kodeProdukTextField(),
                    const SizedBox(height: 16), // Jarak antar elemen
                    _namaProdukTextField(),
                    const SizedBox(height: 16), // Jarak antar elemen
                    _hargaProdukTextField(),
                    const SizedBox(height: 24), // Jarak atas tombol
                    _buttonSubmit(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Membuat Textbox Kode Produk
  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Textbox Nama Produk
  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Textbox Harga Produk
  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
      child: Text(tombolSubmit),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Tambahkan logika untuk menyimpan atau mengupdate data produk
          // Misalnya, Anda bisa memanggil API atau menyimpan ke database
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Proses berhasil")),
          );
        }
      },
    );
  }
}
