import 'package:calling/widgets/CallLogTile.dart';
import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  int _currentIndex = 0; // Bottom Navigation Bar index

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
                _buildTabButton(context, 'Calls', Icons.keyboard_arrow_down_outlined, () {}),
                SizedBox(width: 10),
                _buildTabButton(context, 'Contacts', Icons.keyboard_arrow_down_outlined, () {
                  Navigator.pushReplacementNamed(context, '/contacts'); // Add route for Contacts
                }),
                SizedBox(width: 10),
                _buildTabButton(context, 'Messages', Icons.keyboard_arrow_down_outlined, () {
                  Navigator.pushReplacementNamed(context, '/messages'); // Add route for Messages
                }),
                SizedBox(width: 10),
                _buildTabButton(context, 'Favorites', Icons.keyboard_arrow_down_outlined, () {
                  Navigator.pushReplacementNamed(context, '/favorites'); // Add route for Favorites
                }),
              ],
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Today'),
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Business',
                  icon: Icons.call_made,
                  time: '12:00 PM',
                  callType: 'Outgoing',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Tejal',
                  type: 'Personal',
                  icon: Icons.call_missed,
                  time: '12:00 PM',
                  callType: 'Missed',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Akshada',
                  type: 'Personal',
                  icon: Icons.call_received,
                  time: '12:00 PM',
                  callType: 'Incoming',
                  isSpam: false,
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Personal',
                  icon: Icons.report,
                  time: '12:00 PM',
                  callType: 'Spam',
                  isSpam: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Older'),
                ),
                CallLogTile(
                  name: '+91 9685485260',
                  type: 'Business',
                  icon: Icons.call_made,
                  time: '12:00 PM',
                  callType: 'Outgoing',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Tejal',
                  type: 'Personal',
                  icon: Icons.call_missed_outgoing,
                  time: '12:00 PM',
                  callType: 'Missed',
                  isSpam: false,
                ),
                CallLogTile(
                  name: 'Akshada',
                  type: 'Business',
                  icon: Icons.call_received,
                  time: '12:00 PM',
                  callType: 'Incoming',
                  isSpam: false,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/'); // Navigate to home page
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/dialpad'); // Navigate to dialpad
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/reachouts'); // Navigate to reachouts
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profile'); // Navigate to profile
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
