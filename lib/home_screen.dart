import 'package:flutter/material.dart';
import 'add_habit_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final void Function(bool isDarkMode) onToggleTheme;

  const HomeScreen({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Center(child: Text('Habit List')),
      AddHabitScreen(),
      ProfileScreen(
        isDarkMode: widget.themeMode == ThemeMode.dark,
        onThemeChanged: widget.onToggleTheme,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Habit Tracker')),
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.surfaceVariant,  // Ensure contrast
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildNavItem(Icons.check_box, 'Habits', 0),
              Expanded(child: SizedBox()), // For spacing
              _buildNavItem(Icons.person, 'Profile', 2),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 30,
            child: SizedBox(
              height: 65,
              width: 65,
              child: FloatingActionButton(
                onPressed: () => setState(() => _selectedIndex = 1),
                backgroundColor: Colors.blue,  // Keep FAB color consistent with the theme
                shape: CircleBorder(),
                elevation: 10,
                child: Icon(Icons.add, size: 30, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 12,
                color: _selectedIndex == 1
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context,).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => setState(() => _selectedIndex = index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: _getIconColor(isSelected),
              ),
              SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: _getTextColor(isSelected),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to get icon color based on selection
  Color _getIconColor(bool isSelected) {
    return isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.5);
  }

  // Helper function to get text color based on selection
  Color _getTextColor(bool isSelected) {
    return isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.5);
  }
}
