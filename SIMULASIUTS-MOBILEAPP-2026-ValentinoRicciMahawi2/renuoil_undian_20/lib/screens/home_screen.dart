import 'package:flutter/material.dart';
import 'empty_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _goEmpty(BuildContext context, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => EmptyPage(title: title)));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome + mascot + seller toggle
          Container(
            color: const Color(0xFFFFC107),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset('assets/images/maskot_rno.png', width: 70, height: 70),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Welcome!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text('I am Reviva, the mascot\nof ReNuOil!', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Seller', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          // Map section
          GestureDetector(
            onTap: () => _goEmpty(context, 'Map'),
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.asset('assets/images/map_rno.jpeg', width: double.infinity, height: 180, fit: BoxFit.cover),
                    Positioned(
                      bottom: 8, left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                        child: const Text('Nearest ReNuOil (1.9km)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Positioned(
                      bottom: 8, right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: const Color(0xFFFFC107), borderRadius: BorderRadius.circular(8)),
                        child: const Text('Map 🗺️', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Harga RNO/Liter
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9C4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFC107)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: const [
                  Icon(Icons.bar_chart, color: Color(0xFFFFC107)),
                  SizedBox(width: 8),
                  Text('Harga RNO / Liter', style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFFFFC107), borderRadius: BorderRadius.circular(8)),
                  child: const Text('Rp8.336*', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text('Prices may change over time*', style: TextStyle(fontSize: 10, color: Colors.grey)),
          ),

          // Achievement
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 6),
            child: Text('Achievement', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          GestureDetector(
            onTap: () => _goEmpty(context, 'Achievement'),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey[200],
                        child: const Icon(Icons.emoji_events, color: Colors.amber, size: 26),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text('25.0 Liter towards Bronze 🔥',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.25,
                    backgroundColor: Colors.grey[200],
                    color: const Color(0xFFFFC107),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Collected this month:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('0.00L', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Last month bonus:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('Rp0', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Promotion and offer
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 6),
            child: Text('Promotion and offer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          GestureDetector(
            onTap: () => _goEmpty(context, 'Promotion'),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Row(
                children: const [
                  Icon(Icons.card_giftcard, color: Color(0xFFFFC107)),
                  SizedBox(width: 12),
                  Text('Promotion', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          ),

          // Premium Price Bonus
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 6),
            child: Text('Premium Price Bonus', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          GestureDetector(
            onTap: () => _goEmpty(context, 'Premium Price Bonus'),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Column(
                children: [
                  // Pyramid layout
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Gold (top center)
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [Color(0xFFFFD700), Color(0xFFFFA500)]),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: const [
                                  Text('1', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                                  Icon(Icons.workspace_premium, color: Colors.white, size: 30),
                                  Text('Gold', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Silver
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: const [
                              Text('2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Icon(Icons.workspace_premium, color: Colors.grey, size: 24),
                              Text('Silver', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Bonus: 5%\n50L', style: TextStyle(fontSize: 11), textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                      // Bronze
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFCD7F32).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: const [
                              Text('3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Icon(Icons.workspace_premium, color: Color(0xFFCD7F32), size: 24),
                              Text('Bronze', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Bonus: 2.5%\n25L', style: TextStyle(fontSize: 11), textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9C4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Want to get more bonuses? Raise your level to increase your income per liter of recycled used cooking oil with our monthly premium bonus!",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Why should you recycle ReNuOil?
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 6),
            child: Text('Why should you recycle ReNuOil?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),

          // Easy Money card
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset('assets/images/maskot_rno.png',
                      width: double.infinity, height: 160, fit: BoxFit.cover),
                ),
                Container(
                  width: double.infinity,
                  color: const Color(0xFFFFC107),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Easy Money', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                        'Reselling and making money from what you have used sounds interesting, right? So, save the used cooking oil that you have used and sell it! 🌱',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
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
