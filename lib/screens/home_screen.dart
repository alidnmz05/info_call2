import 'package:flutter/material.dart';
import 'package:info_call2/screens/add_customer_screen.dart';
import 'package:info_call2/screens/customers_screen.dart';

import 'focus_screen.dart';
import 'how_to_use_screen.dart';

// FocusScreen Widget

// AddCustomerFormScreen Widget
class AddCustomerFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Müşteri Ekleme Formu',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

// RegisteredCustomersScreen Widget
class RegisteredCustomersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Kayıtlı Müşteriler Sayfası',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

// Main AddCustomerScreen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  // Sayfa geçişi için _widgetOptions listesini kaldırdık.
  List<Widget> _widgetOptions = <Widget>[
    FocusScreen(),
    AddCustomerScreen(),
    CustomersScreen(),
    HowToUseScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.jpg', // Logo dosyasının yolu
          height: 40,
        ),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Image.asset(
                'assets/logo.jpg', // Logo dosyasının yolu
                height: 50,
              ),
            ),
            // Menu items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.center_focus_strong_outlined,
                        color: Colors.redAccent),
                    title: Text('Odaklama'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FocusScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add, color: Colors.redAccent),
                    title: Text('Müşteri Ekle'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people, color: Colors.redAccent),
                    title: Text('Kayıtlı Müşteriler'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisteredCustomersScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.redAccent),
                    title: Text('Nasıl Kullanılır'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HowToUseScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Profile and logout button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Avatar and name
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/avatar.jpg'), // Avatar image path
                        radius: 20, // Avatar size
                      ),
                      SizedBox(width: 8), // Space between avatar and name
                      Text(
                        'Mustafa Çelik',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // Logout button
                  IconButton(
                    icon: Icon(Icons.exit_to_app, color: Colors.grey),
                    onPressed: () {
                      // Handle logout action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_strong_outlined),
            label: 'Odak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Müşteri Ekle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Kayıtlı Müşteriler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Nasıl Kullanılır',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.white,
        elevation: 2,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
      ),
      resizeToAvoidBottomInset:
          false, // Keyboard açıldığında alt barın kaybolmasını engeller
      extendBody:
          false, // Alt barın üzerini kaplamaması için body'nin alt kısmını genişletir
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
