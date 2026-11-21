import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});
  static const numbers = ['03008319943', '03000084907'];
  Future<void> open(String value) async {
    final uri = Uri.parse(value);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) throw Exception('Could not open $uri');
  }
  String clean(String n) => '92${n.substring(1)}';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Contact Us')),
    body: ListView(padding: const EdgeInsets.all(18), children: [
      const Text('Get in Touch', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800)),
      const SizedBox(height: 6), const Text('Contact us to discuss your construction project.', style: TextStyle(color: Colors.black54)),
      const SizedBox(height: 18),
      for (final n in numbers) Card(child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(n, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), const SizedBox(height: 10), Row(children: [Expanded(child: OutlinedButton.icon(onPressed: () => open('tel:$n'), icon: const Icon(Icons.call), label: const Text('Call'))), const SizedBox(width: 10), Expanded(child: FilledButton.icon(onPressed: () => open('https://wa.me/${clean(n)}'), icon: const Icon(Icons.chat), label: const Text('WhatsApp')))])]))),
      const SizedBox(height: 16),
      const Text('Business Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8), const ListTile(contentPadding: EdgeInsets.zero, leading: Icon(Icons.location_on, color: Color(0xFFB58A35)), title: Text('Old Habib Cotton Factory, Pano Akil, Sindh, Pakistan')),
      FilledButton.tonalIcon(onPressed: () => open('https://www.google.com/maps/search/?api=1&query=Old+Habib+Cotton+Factory+Pano+Akil+Sindh'), icon: const Icon(Icons.directions), label: const Text('Get Directions')),
      const SizedBox(height: 22), const Text('Appointment Hours', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8), const Text('Monday–Thursday: After 6:00 PM\nFriday: 10:00 AM–5:00 PM\nSaturday–Sunday: After 6:00 PM', style: TextStyle(height: 1.8, color: Colors.black54)),
    ]),
  );
}
