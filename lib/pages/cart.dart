import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Color buttonColor = Colors.blue.shade700; // Warna latar belakang tombol
  Color hoverColor = Colors.lightBlue; // Warna saat hover
  bool isHovered = false; // Status hover

  // Simulasi data produk di keranjang
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'ASUS TUF Gaming',
      'price': 16000000,
      'quantity': 1,
      'image': 'images/sohe.jpg',
      'isChecked': false,
    },
    {
      'name': 'ASUS ROG',
      'price': 20000000,
      'quantity': 1,
      'image': 'images/sohe.jpg',
      'isChecked': false,
    },
    {
      'name': 'Acer Predator',
      'price': 6500000,
      'quantity': 1,
      'image': 'images/sohe.jpg',
      'isChecked': false,
    },
  ];

  // Fungsi untuk memformat harga ke format Rupiah
  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return formatter.format(amount);
  }

  // Fungsi untuk menghitung total harga
  int getTotalPrice() {
    return cartItems.fold(0, (total, item) {
      if (item['isChecked'] == true) {
        int price = item['price'] ?? 0; // Menggunakan nilai default jika null
        int quantity =
            item['quantity'] ?? 1; // Menggunakan nilai default jika null
        return total + (price * quantity);
      }
      return total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Keranjang Belanja',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          var item = cartItems[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Checkbox untuk memilih barang
                  Checkbox(
                    value: item['isChecked'] ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        item['isChecked'] = value ?? false;
                      });
                    },
                  ),
                  // Gambar produk
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      item['image'] ??
                          'images/default.jpg', // Gunakan gambar default jika tidak ada
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          width: 70.0,
                          height: 70.0,
                          child: const Center(child: Icon(Icons.error)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  // Info produk
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['name'] ?? 'Nama tidak tersedia',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          formatCurrency(item['price'] ??
                              0), // Menggunakan fungsi formatCurrency
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  // Kontrol jumlah produk
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            setState(() {
                              if (item['quantity'] > 1) {
                                item['quantity'] -= 1;
                              }
                            });
                          },
                        ),
                        Text(
                          '${item['quantity'] ?? 1}', // Gunakan default jika null
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () {
                            setState(() {
                              item['quantity'] = (item['quantity'] ?? 1) +
                                  1; // Menggunakan nilai default
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total: ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  formatCurrency(
                      getTotalPrice()), // Menggunakan fungsi formatCurrency
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                // Aksi saat tombol booking ditekan
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 13.0, horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Membuat tombol lebih bulat
                ),
                elevation: 5, // Tambahkan efek bayangan
                backgroundColor: buttonColor, // Warna latar belakang
                foregroundColor: Colors.white, // Warna teks
              ),
              child: const Text(
                'Lanjutkan Booking',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Efek hover dan pressed
              onHover: (isHovered) {
                setState(() {
                  buttonColor = isHovered
                      ? hoverColor
                      : Colors.green; // Ubah warna saat hover
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
