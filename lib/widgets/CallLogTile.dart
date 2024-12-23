
import 'package:flutter/material.dart';

class CallLogTile extends StatelessWidget {
  final String name;
  final String type;
  final IconData icon;
  final String time;
  final String callType;
  final bool isSpam;

  CallLogTile({
    required this.name,
    required this.type,
    required this.icon,
    required this.time,
    required this.callType,
    required this.isSpam,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isSpam ? Colors.red : Colors.blue,
        child: Icon(
          isSpam ? Icons.report : Icons.person,
          color: Colors.white,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            type,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: callType == 'Missed' ? Colors.red : Colors.green,
          ),
          SizedBox(width: 5),
          Text(callType),
          Spacer(),
          Text(time),
        ],
      ),
      trailing: Icon(
        Icons.info_outline,
        color: Colors.grey,
      ),
    );
  }
}
