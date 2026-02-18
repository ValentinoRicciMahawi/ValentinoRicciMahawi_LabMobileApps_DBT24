import 'package:flutter/material.dart';
import 'empty_page.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  String? _selectedCourier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Map
          SizedBox(
            height: 260,
            child: Image.asset('assets/images/map_rno.jpeg', fit: BoxFit.cover, width: double.infinity),
          ),
          // Form
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // From
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.home, color: Colors.black),
                      SizedBox(width: 10),
                      Expanded(child: Text('BMW Astra Serpong', style: TextStyle(fontSize: 14))),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Nearest ReNuOil
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/logo_rno.png', width: 24, height: 24),
                      const SizedBox(width: 10),
                      const Expanded(
                          child: Text('Nearest ReNuOil (B Residence BSD City)',
                              style: TextStyle(fontSize: 13, color: Colors.grey))),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text('Amount  :  ', style: TextStyle(fontSize: 14)),
                    SizedBox(
                      width: 50,
                      height: 40,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('Liters', style: TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Text('Type of oil : ', style: TextStyle(fontSize: 14)),
                    Text('-', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Courier :  ', style: TextStyle(fontSize: 14)),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: _selectedCourier,
                          isExpanded: true,
                          underline: const SizedBox(),
                          hint: const Text('Select courier'),
                          items: ['Courier A', 'Courier B', 'Courier C']
                              .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                              .toList(),
                          onChanged: (v) => setState(() => _selectedCourier = v),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const EmptyPage(title: 'Request'))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Request', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
