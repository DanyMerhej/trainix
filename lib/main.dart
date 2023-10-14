import 'package:flutter/material.dart';
import 'package:trainix/clients_screen.dart';
import 'package:trainix/profile_screen.dart';
import 'package:trainix/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRAINIX',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Start with the "Profile" tab selected

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRAINIX'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: _selectedIndex == 0
          ? ProfileTab()
          : _selectedIndex == 1
          ? ClientsTab()
          : SettingsTab(), // Show the appropriate tab based on the selected index
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Danny Merhej',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                'danymerhej.work@gmail.com',
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/300?img=3'), // sample profile picture
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              arrowColor: Colors.yellow,
            ),
            // ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text('Settings'),
            //   onTap: () {
            //     Navigator.pop(context); // Close the drawer
            //     setState(() {
            //       _selectedIndex = 2; // Set the selected index to the "Settings" tab
            //     });
            //   },
            // ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Handle logout logic here
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}

