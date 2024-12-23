import 'package:calling/calls.dart';
import 'package:calling/contacts.dart';
import 'package:calling/dial_page.dart';
import 'package:calling/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:calling/profile.dart';
import 'package:calling/dial_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Index for Bottom Navigation Bar

  // Screens for Bottom Navigation
  final List<Widget> _pages = [
    Center(child: Text('Connects Page')),
    Center(child: Text('Dialpad Page')),
    Center(child: Text('Reachouts Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_appbar.png',
              height: 30,
              width: 30,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SUREFY.AI',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'always be sure',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.grey.shade700),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_sharp, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 10),
                _buildTabButton(context, 'Calls', Icons.keyboard_arrow_down_outlined, () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Calls()),
                  );
                }),
                SizedBox(width: 10),

                _buildTabButton(context, 'Contacts', Icons.keyboard_arrow_down_outlined, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Contacts()),
                  );
                }),
                SizedBox(width: 10),
                _buildTabButton(context, 'Messages', Icons.keyboard_arrow_down_outlined, () {
                  _showFloatingDialog(context);
                }),
                SizedBox(width: 10),
                _buildTabButton(context, 'Favorites', Icons.keyboard_arrow_down_outlined, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Center(child: Text('Favorites Page'))),
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(child: _pages[_currentIndex]), // Display current selected page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Center(child: Text('Connects Page'))),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DialPage(onDialButtonPressed: (String value) {  },)),
            );
          } else if (index == 2) {
            _showFloatingDialog(context);
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF5864F8),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Connects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dialpad_outlined),
            label: 'Dialpad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: 'Reachouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Function to Show Floating Dialog
  void _showFloatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Open Messages'),
          content: Text('Do you want to open the Messages screen?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog without opening Messages
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessageScreen()),
                ); // Open Messages screen
              },
              child: Text('Open'),
            ),
          ],
        );
      },
    );
  }

  // Helper Widget to Build Tab Buttons
  Widget _buildTabButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          SizedBox(width: 4),
          Icon(icon, color: Colors.blue),
        ],
      ),
    );
  }
}
