import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = "Your Name";
  bool _isEditing = false;
  final _controller = TextEditingController();

  bool _darkMode = false; // for the switch

  @override
  void initState() {
    super.initState();
    _controller.text = _name;
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveName() {
    setState(() {
      _name = _controller.text;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Profile image (placeholder)
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          SizedBox(height: 20),

          // Name and edit button
          _isEditing
              ? Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(labelText: 'Enter your name'),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: _saveName,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _name,
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: _toggleEditing,
                    ),
                  ],
                ),

          SizedBox(height: 30),

          // Dark mode toggle (just for practice)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark Mode'),
              Switch(
                value: _darkMode,
                onChanged: (value) {
                  setState(() {
                    _darkMode = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
