import 'package:flutter/material.dart';

class CustomersScreen extends StatefulWidget {
  @override
  _CustomersScreenState createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  final List<String> customerNames = [
    'Ali Yılmaz',
    'Ayşe Kara',
    'Mehmet Demir',
    'Zeynep Çelik',
    'Fatma Ak',
    'Ahmet Beyaz',
  ];

  List<String> filteredCustomerNames = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    // İlk başta tüm müşterileri göster
    filteredCustomerNames = customerNames;
  }

  void _filterCustomers(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredCustomerNames = customerNames
          .where((name) => name.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterCustomers,
              decoration: InputDecoration(
                hintText: 'Müşteri ara...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.redAccent),
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            // ListView.builder'ın alanı düzgün kullanmasını sağlar
            child: ListView.builder(
              itemCount: filteredCustomerNames.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        filteredCustomerNames[index][0], // İlk harfi göster
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      filteredCustomerNames[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${filteredCustomerNames[index]} seçildi!'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
