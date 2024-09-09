// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.green.shade700,
//         title: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 height: 40,
//                 child: TextField(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                     hintText: 'Search in Tokopedia...',
//                     prefixIcon: Icon(Icons.search, color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             Icon(Icons.notifications_none, color: Colors.white),
//             SizedBox(width: 10),
//             Icon(Icons.shopping_cart_outlined, color: Colors.white),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Promotional Banners
//             Container(
//               height: 150,
//               margin: EdgeInsets.symmetric(vertical: 10),
//               child: PageView(
//                 children: [
//                   promoBanner('assets/banner1.png'),
//                   promoBanner('assets/banner2.png'),
//                   promoBanner('assets/banner3.png'),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),

//             // Categories Section
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 'Categories',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             categoriesSection(),

//             // Flash Sale
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 'Flash Sale',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.redAccent,
//                 ),
//               ),
//             ),
//             flashSaleSection(),

//             // Recommended Products
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 'Recommended for You',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//             productGrid(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Promo banner widget
//   Widget promoBanner(String imagePath) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         image: DecorationImage(
//           image: AssetImage(imagePath),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   // Categories section widget
//   Widget categoriesSection() {
//     List<String> categories = [
//       'Asus',
//       'ROG',
//       'MSI',
//       'Legion',
//       'HP',
//     ];

//     return Container(
//       height: 90,
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           return categoryItem(
//               categories[index], 'assets/category${index + 1}.png');
//         },
//       ),
//     );
//   }

//   Widget categoryItem(String title, String iconPath) {
//     return Container(
//       width: 70,
//       margin: EdgeInsets.only(right: 10),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.white,
//             backgroundImage: AssetImage(iconPath),
//           ),
//           SizedBox(height: 5),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 12, color: Colors.black87),
//           ),
//         ],
//       ),
//     );
//   }

//   // Flash sale section widget
//   Widget flashSaleSection() {
//     return Container(
//       height: 180,
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return flashSaleItem(
//               'assets/product${index + 1}.png', '\$${(index + 1) * 10}');
//         },
//       ),
//     );
//   }

//   Widget flashSaleItem(String imagePath, String price) {
//     return Container(
//       width: 130,
//       margin: EdgeInsets.only(right: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade300,
//             spreadRadius: 1,
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//             child: Image.asset(
//               imagePath,
//               height: 100,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               price,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.redAccent,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Product grid widget
//   Widget productGrid() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: 6,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 0.75,
//         ),
//         itemBuilder: (context, index) {
//           return productItem('assets/product${index + 1}.png',
//               'Product ${index + 1}', '\$${(index + 1) * 20}');
//         },
//       ),
//     );
//   }

//   Widget productItem(String imagePath, String title, String price) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade300,
//             spreadRadius: 1,
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//             child: Image.asset(
//               imagePath,
//               height: 120,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               price,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green.shade700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'taStore',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section: Featured Product or Banner
            heroSection(),
            SizedBox(height: 20),

            // Categories
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Brand Laptop',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10),
            categoriesSection(),

            SizedBox(height: 20),

            // Featured Products
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Best Laptop Gaming',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10),
            productGrid(),

            // Padding at the bottom
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Hero Section for featured product or banner
  Widget heroSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('images/CHK.jpg'), // Replace with actual image
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          'Featured Collection',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Categories section widget
  Widget categoriesSection() {
    List<String> categories = ['Asus', 'MSI', 'LEGION', 'HP', 'Acer'];
    List<String> categoryImages = [
      'images/LogoTuf.png',
      'images/LogoTuf.png',
      'images/LogoTuf.png',
      'images/LogoTuf.png',
      'images/LogoTuf.png',
    ]; // Update with your actual image paths

    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return categoryItem(categories[index], categoryImages[index]);
        },
      ),
    );
  }

  Widget categoryItem(String title, String iconPath) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            backgroundImage: AssetImage(iconPath), // Use actual category icon
          ),
          SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // Product grid widget for featured products
  Widget productGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6, // Number of products to display
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return productItem('assets/product${index + 1}.png',
              'Product ${index + 1}', '\$${(index + 1) * 50}');
        },
      ),
    );
  }

  // Product item card
  Widget productItem(String imagePath, String title, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              'images/CHK.jpg', // Replace with actual product image
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
