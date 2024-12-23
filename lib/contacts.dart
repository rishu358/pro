import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  int _currentIndex = 0;

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
                _buildTabButton(context, 'Calls'),
                SizedBox(width: 10),
                _buildTabButton(context, 'Contacts'),
                SizedBox(width: 10),
                _buildTabButton(context, 'Messages'),
                SizedBox(width: 10),
                _buildTabButton(context, 'Favorites'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: _buildContactsList(),
          ),
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

  Widget _buildTabButton(BuildContext context, String title) {
    return ElevatedButton(
      onPressed: () {},
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
          Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildContactsList() {
    final contacts = [
      {'name': 'Adnya', 'type': 'Personal'},
      {'name': 'Ajinkya', 'type': 'Business'},
      {'name': 'Akansha', 'type': 'Personal'},
      {'name': 'Akshita', 'type': 'Personal'},
      {'name': 'Aishwarya', 'type': 'Personal'},
      {'name': 'Alisha', 'type': 'Business'},
      {'name': 'Bhavika', 'type': 'Business'},
      {'name': 'Bhakti', 'type': 'Business'},
      {'name': 'Bharti', 'type': 'Personal'},
      {'name': 'Birla', 'type': 'Business'},
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: contacts.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text('A', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        }

        final contact = contacts[index - 1];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: contact['type'] == 'Personal' ? Colors.blue.shade100 : Colors.green.shade100,
            child: Icon(
              contact['type'] == 'Personal' ? Icons.person : Icons.business,
              color: Colors.blue.shade800,
            ),
          ),
          title: Text(contact['name']!),
          subtitle: Text(contact['type']!),
        );
      },
    );
  }
}
