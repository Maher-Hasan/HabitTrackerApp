import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final bool isDarkMode;
  final void Function(bool isDarkMode) onThemeChanged;

  const ProfileScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = "Your Name";
  bool _isEditing = false;
  final _controller = TextEditingController();

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
      _name = _controller.text.trim().isEmpty ? _name : _controller.text;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center( // Centering the entire column
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600), // Optional constraint for max width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image and spacing
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              // Name section with edit button
              _isEditing
                  ? Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              labelText: 'Enter your name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.check),
                          onPressed: _saveName,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _name,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: _toggleEditing,
                        ),
                      ],
                    ),

              const SizedBox(height: 32),

              // Settings section title
              Text("Settings", style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 12),

              // Dark Mode toggle switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Dark Mode"),
                  Switch(
                    value: widget.isDarkMode,
                    onChanged: widget.onThemeChanged,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
