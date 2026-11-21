import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});
  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final details = TextEditingController();
  String service = 'Complete Construction';
  DateTime? date;
  TimeOfDay? time;
  String? message;

  bool isAllowed(DateTime d, TimeOfDay t) {
    if (d.weekday == DateTime.friday) {
      final mins = t.hour * 60 + t.minute;
      return mins >= 600 && mins <= 1020; // Friday 10:00 AM–5:00 PM
    }
    return t.hour >= 18; // After 6:00 PM; no closing time was specified.
  }

  Future<void> pickDate() async {
    final chosen = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)), initialDate: date ?? DateTime.now());
    if (chosen != null) setState(() { date = chosen; time = null; message = null; });
  }
  Future<void> pickTime() async {
    if (date == null) { setState(() => message = 'Please select an appointment date first.'); return; }
    final chosen = await showTimePicker(context: context, initialTime: time ?? TimeOfDay.now());
    if (chosen != null) setState(() { time = chosen; message = isAllowed(date!, chosen) ? null : (date!.weekday == DateTime.friday ? 'Friday appointments are only available from 10:00 AM to 5:00 PM.' : 'Appointments on this day are available after 6:00 PM.'); });
  }
  @override
  void dispose() { name.dispose(); phone.dispose(); details.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Book an Appointment')),
    body: ListView(padding: const EdgeInsets.all(18), children: [
      const Text('Let’s discuss your project', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
      const SizedBox(height: 6), const Text('Submit your details and the team can contact you to confirm.', style: TextStyle(color: Colors.black54)),
      const SizedBox(height: 20),
      Form(key: formKey, child: Column(children: [
        _field(name, 'Full Name', Icons.person_outline), const SizedBox(height: 12),
        _field(phone, 'Phone Number', Icons.phone_outlined, keyboard: TextInputType.phone), const SizedBox(height: 12),
        DropdownButtonFormField<String>(value: service, decoration: const InputDecoration(labelText: 'Service Type', border: OutlineInputBorder()), items: const ['Complete Construction','Renovation & Finishing','Woodwork & Carpentry','Electrical Work','Sanitary & Plumbing','Labour & Machinery'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(), onChanged: (v) => setState(() => service = v ?? service)),
        const SizedBox(height: 12),
        Row(children: [Expanded(child: OutlinedButton.icon(onPressed: pickDate, icon: const Icon(Icons.calendar_today), label: Text(date == null ? 'Select Date' : '${date!.day}/${date!.month}/${date!.year}'))), const SizedBox(width: 10), Expanded(child: OutlinedButton.icon(onPressed: pickTime, icon: const Icon(Icons.access_time), label: Text(time?.format(context) ?? 'Select Time')))]),
        const SizedBox(height: 8), const Align(alignment: Alignment.centerLeft, child: Text('Mon–Thu & Sat–Sun: after 6:00 PM\nFriday: 10:00 AM–5:00 PM', style: TextStyle(color: Colors.black54, height: 1.5))),
        const SizedBox(height: 12), TextFormField(controller: details, maxLines: 4, decoration: const InputDecoration(labelText: 'Project Details', alignLabelWithHint: true, border: OutlineInputBorder())),
        if (message != null) Padding(padding: const EdgeInsets.only(top: 10), child: Text(message!, style: const TextStyle(color: Colors.red))),
        const SizedBox(height: 18), SizedBox(width: double.infinity, child: FilledButton(onPressed: () {
          if (!formKey.currentState!.validate()) return;
          if (date == null || time == null) { setState(() => message = 'Please select a date and time.'); return; }
          if (!isAllowed(date!, time!)) { setState(() => message = date!.weekday == DateTime.friday ? 'Please choose Friday between 10 AM and 5 PM.' : 'Please choose a time after 6 PM.'); return; }
          setState(() => message = 'Request prepared. Please call or WhatsApp the company to confirm your appointment.');
        }, child: const Text('Submit Appointment Request'))),
      ])),
    ]),
  );

  Widget _field(TextEditingController c, String label, IconData icon, {TextInputType keyboard = TextInputType.text}) => TextFormField(controller: c, keyboardType: keyboard, validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter $label' : null, decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon), border: const OutlineInputBorder()));
}
