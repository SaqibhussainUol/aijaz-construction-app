import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Our Projects')),
    body: ListView(padding: const EdgeInsets.all(18), children: const [
      SectionTitle('Project Portfolio', subtitle: 'A showcase of our construction work.'),
      SizedBox(height: 8),
      _ProjectPlaceholder(title: 'Residential Construction', type: 'Houses', icon: Icons.home_work_outlined),
      _ProjectPlaceholder(title: 'Industrial Construction', type: 'Factories & Mills', icon: Icons.factory_outlined),
      _ProjectPlaceholder(title: 'Commercial Buildings', type: 'Flats & Commercial', icon: Icons.apartment),
      SizedBox(height: 12),
      Text('Project photos and verified project details can be added by the business admin after setup.', style: TextStyle(color: Colors.black54, height: 1.5)),
    ]),
  );
}

class _ProjectPlaceholder extends StatelessWidget {
  final String title, type; final IconData icon;
  const _ProjectPlaceholder({required this.title, required this.type, required this.icon});
  @override
  Widget build(BuildContext context) => Card(margin: const EdgeInsets.only(bottom: 12), child: ListTile(contentPadding: const EdgeInsets.all(14), leading: Container(width: 54, height: 54, decoration: BoxDecoration(color: const Color(0xFFF2E9D5), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: const Color(0xFF9B762E))), title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(type)));
}
