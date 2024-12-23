import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int _currentIndex = 2; // Default to Reachouts page

  // Screens for Bottom Navigation
  final List<Widget> _pages = [
    Center(child: Text('Connects Page')),
    Center(child: Text('Dialpad Page')),
    MessagesScreen(), // Middle portion updated
    ProfileScreen(), // Profile page with onTap functionality
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
                _buildTabButton(context, 'Contacts', Icons.keyboard_arrow_down_outlined, () {}),
                SizedBox(width: 10),
                _buildTabButton(context, 'Messages', Icons.keyboard_arrow_down_outlined, () {}),
                SizedBox(width: 10),
                _buildTabButton(context, 'Favorites', Icons.keyboard_arrow_down_outlined, () {}),
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

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        buildMessageTile('+91 9685485260', 'Hi, Can you tell me your name?', '12:00 PM', 'Personal'),
        buildMessageTile('Akshada', 'Typing...', '24/7/2024', 'Business'),
        buildMessageTile('+91 9685485260', 'Hi, Can you tell me your name?', '24/7/2024', 'Business'),
        buildMessageTile('+91 9685485260', 'Hi, Can you tell me your name?', '22/6/2024', 'Personal'),
      ],
    );
  }

  Widget buildMessageTile(String name, String message, String time, String tag) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade100,
        child: Text(name[0], style: TextStyle(color: Colors.blue)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: tag == 'Personal' ? Colors.blue.shade100 : Colors.green.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: tag == 'Personal' ? Colors.blue : Colors.green,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
      subtitle: Text(message),
      trailing: Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Navigate to a detailed profile page or perform an action
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Profile page tapped")),
          );
        },
        child: Text('Go to Profile Details'),
      ),
    );
  }
}
