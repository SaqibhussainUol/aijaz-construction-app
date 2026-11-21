import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/appointment_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/contact_screen.dart';

void main() => runApp(const AijazConstructionApp());

class AijazConstructionApp extends StatelessWidget {
  const AijazConstructionApp({super.key});

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFD6AD55);
    return MaterialApp(
      title: 'AIJAZ AHMED & SONS CONSTRUCTION',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: gold, brightness: Brightness.light),
        scaffoldBackgroundColor: const Color(0xFFF7F6F2),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF151515), foregroundColor: Colors.white),
        cardTheme: CardThemeData(color: Colors.white, elevation: 1, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int index = 0;
  final pages = const [HomeScreen(), ProjectsScreen(), AppointmentScreen(), ContactScreen()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(index: index, children: pages),
    bottomNavigationBar: NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (value) => setState(() => index = value),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.apartment_outlined), selectedIcon: Icon(Icons.apartment), label: 'Projects'),
        NavigationDestination(icon: Icon(Icons.calendar_month_outlined), selectedIcon: Icon(Icons.calendar_month), label: 'Appointment'),
        NavigationDestination(icon: Icon(Icons.call_outlined), selectedIcon: Icon(Icons.call), label: 'Contact'),
      ],
    ),
  );
}
