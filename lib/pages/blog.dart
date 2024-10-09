import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Blog',
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            headerBanner(),

            SizedBox(height: 20),

            // Blog Articles
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent Articles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10),
            articleList(),
          ],
        ),
      ),
    );
  }

  // Header Banner Widget
  Widget headerBanner() {
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
          'Our Latest Blog Posts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // List of Articles Widget
  Widget articleList() {
    List<Map<String, String>> articles = [
      {
        'title': 'The Ultimate Guide to Gaming Laptops',
        'summary':
            'Discover the best gaming laptops with powerful features and sleek designs.',
        'image': 'images/CHK.jpg', // Replace with actual image
      },
      {
        'title': 'Top 5 Laptop Brands for 2024',
        'summary':
            'Find out which laptop brands are leading the market this year.',
        'image': 'images/CHK.jpg', // Replace with actual image
      },
      {
        'title': 'How to Choose the Perfect Laptop',
        'summary':
            'Learn how to select the right laptop that fits your needs and budget.',
        'image': 'images/CHK.jpg', // Replace with actual image
      },
    ];

    return Column(
      children: articles.map((article) => articleCard(article)).toList(),
    );
  }

  // Article Card Widget
  Widget articleCard(Map<String, String> article) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              article['image']!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article['title']!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              article['summary']!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
