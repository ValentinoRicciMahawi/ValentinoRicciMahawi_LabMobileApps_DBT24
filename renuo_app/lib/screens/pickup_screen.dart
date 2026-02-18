import 'package:flutter/material.dart';
import 'empty_page.dart';

class PickupScreen extends StatelessWidget {
  const PickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            color: const Color(0xFFF5C518),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 12, right: 12, bottom: 12,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.grey, size: 18),
                        SizedBox(width: 8),
                        Text('Start your search', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Map
                  Container(
                    height: 280,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/map_rno.jpeg',
                          width: double.infinity,
                          height: 280,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey[300],
                            child: const Center(child: Icon(Icons.map, size: 80, color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Form Section
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // From
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.home_outlined, size: 20),
                              const SizedBox(width: 10),
                              const Expanded(child: Text('BMW Astra Serpong', style: TextStyle(fontSize: 14))),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        // To
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/logo_rno.png',
                                height: 24,
                                errorBuilder: (_, __, ___) => const Icon(Icons.eco, size: 20, color: Colors.green),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(child: Text('Nearest ReNuOil (B Residence BSD City)', style: TextStyle(fontSize: 13, color: Colors.black54))),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Amount
                        Row(
                          children: [
                            const Text('Amount : ', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Container(
                              width: 50, height: 36,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('Liters'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text('Type of oil : -', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        // Courier dropdown
                        Row(
                          children: [
                            const Text('Courier : ', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: const [
                                    Expanded(child: SizedBox()),
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Request Button
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmptyPage(title: 'Request Pick Up'))),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5C518),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text('Request', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
