import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const services = [
    ('Complete Construction', Icons.foundation), ('Renovation & Finishing', Icons.home_repair_service),
    ('Woodwork & Carpentry', Icons.carpenter), ('Electrical Work', Icons.electrical_services),
    ('Sanitary & Plumbing', Icons.plumbing), ('Labour & Machinery', Icons.construction),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('AIJAZ AHMED & SONS', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)), actions: [Padding(padding: const EdgeInsets.only(right: 14), child: Center(child: Text('CONSTRUCTION', style: TextStyle(color: const Color(0xFFD6AD55), fontSize: 10, letterSpacing: 1.4, fontWeight: FontWeight.bold))))]),
    body: ListView(padding: const EdgeInsets.all(18), children: [
      Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(color: const Color(0xFF171717), borderRadius: BorderRadius.circular(22)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('BUILDING TRUST.\nCREATING THE FUTURE.', style: TextStyle(color: Colors.white, fontSize: 26, height: 1.2, fontWeight: FontWeight.w900)),
        const SizedBox(height: 12), const Text('Complete construction contracting for homes, factories, mills and commercial buildings.', style: TextStyle(color: Colors.white70, height: 1.5)),
        const SizedBox(height: 20), Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9), decoration: BoxDecoration(color: const Color(0xFFD6AD55), borderRadius: BorderRadius.circular(10)), child: const Text('QUALITY • COMMITMENT • EXPERIENCE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: .6))),
      ])),
      const SizedBox(height: 25),
      const SectionTitle('About Our Company'),
      const Text('AIJAZ AHMED & SONS CONSTRUCTION provides complete contracting services with its own labour, machinery and equipment. From foundations to finishing, we help bring construction projects to life.', style: TextStyle(height: 1.6, color: Color(0xFF555555))),
      const SizedBox(height: 24),
      const SectionTitle('Our Services', subtitle: 'Complete contracting solutions under one roof.'),
      GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: services.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1.65), itemBuilder: (context, i) => Card(child: Padding(padding: const EdgeInsets.all(13), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Icon(services[i].$2, color: const Color(0xFFB58A35), size: 26), const SizedBox(height: 9), Text(services[i].$1, style: const TextStyle(fontWeight: FontWeight.w700))])))),
      const SizedBox(height: 20),
      const SectionTitle('Projects We Handle'),
      const Wrap(spacing: 8, runSpacing: 8, children: [Chip(label: Text('Houses')), Chip(label: Text('Factories')), Chip(label: Text('Mills')), Chip(label: Text('Flats')), Chip(label: Text('Commercial Buildings'))]),
      const SizedBox(height: 12),
      const Text('Based in Old Habib Cotton Factory, Pano Akil, Sindh, Pakistan.', style: TextStyle(color: Colors.black54, height: 1.5)),
    ]),
  );
}
