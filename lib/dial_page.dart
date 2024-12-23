import 'package:flutter/material.dart';

class DialPage extends StatefulWidget {
  final ValueChanged<String> onDialButtonPressed;

  const DialPage({
    Key? key,
    required this.onDialButtonPressed,
  }) : super(key: key);

  @override
  _KeyPadState createState() => _KeyPadState();
}

class _KeyPadState extends State<DialPage> {
  String dialedNumber = '';
  TextEditingController textController = TextEditingController();

  void updateNumber(String number) {
    setState(() {
      dialedNumber += number;
      textController.text = dialedNumber;
    });
    widget.onDialButtonPressed(
        dialedNumber); // Pass updated number back to parent widget
  }

  void clearLastDigit() {
    setState(() {
      if (dialedNumber.isNotEmpty) {
        dialedNumber = dialedNumber.substring(0, dialedNumber.length - 1);
        textController.text = dialedNumber;
      }
    });
    widget.onDialButtonPressed(
        dialedNumber); // Pass updated number back to parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dial Pad'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: textController,
              enabled: false,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: clearLastDigit,
                  icon: Icon(Icons.cancel_presentation_outlined),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Your dial pad buttons
          // Example:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialPadButton(label: '1', onPressed: () => updateNumber('1')),
              DialPadButton(label: '2', onPressed: () => updateNumber('2')),
              DialPadButton(label: '3', onPressed: () => updateNumber('3')),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialPadButton(label: '4', onPressed: () => updateNumber('4')),
              DialPadButton(label: '5', onPressed: () => updateNumber('5')),
              DialPadButton(label: '6', onPressed: () => updateNumber('6')),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialPadButton(label: '7', onPressed: () => updateNumber('7')),
              DialPadButton(label: '8', onPressed: () => updateNumber('8')),
              DialPadButton(label: '9', onPressed: () => updateNumber('9')),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialPadButton(label: '*', onPressed: () => updateNumber('*')),
              DialPadButton(label: '0', onPressed: () => updateNumber('0')),
              DialPadButton(label: '#', onPressed: () => updateNumber('#')),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class DialPadButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DialPadButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DialPage(onDialButtonPressed: (String value) {
      print('Dialed number: $value');
    }),
  ));
}
