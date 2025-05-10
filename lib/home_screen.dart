import 'package:flutter/material.dart';
import 'add_habit_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // This screen is for the main habit view
    Center(
      child: Text('Habit List'),
    ), // You can later replace this with a proper screen
    AddHabitScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Habit Tracker')),
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0, // Optional: removes shadow
        shape: null, // Remove notch shape
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ensures symmetry
            children: <Widget>[
              // Habits Tab
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    splashColor: Colors.blue.withOpacity(0.2), // Subtle effect
                    highlightColor: Colors.blue.withOpacity(0.1),
                    onTap: () => setState(() => _selectedIndex = 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_box,
                          color: _selectedIndex == 0
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).disabledColor,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Habits',
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedIndex == 0
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).disabledColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Empty slot for center FAB
              Expanded(child: SizedBox()),
              // Profile Tab
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    splashColor: Colors.blue.withOpacity(0.2), // Subtle effect
                    highlightColor: Colors.blue.withOpacity(0.1),
                    onTap: () => setState(() => _selectedIndex = 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 25,
                          color: _selectedIndex == 2
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).disabledColor,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedIndex == 2
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).disabledColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => setState(() => _selectedIndex = 1), // Use direct setState for FAB tap
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 30,
              child: SizedBox(
                height: 65,
                width: 65,
                child: FloatingActionButton(
                  onPressed: null, // Disable default tap since GestureDetector is used
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
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
                      : Theme.of(context).disabledColor,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
