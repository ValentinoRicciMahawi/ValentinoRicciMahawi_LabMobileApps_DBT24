import 'package:flutter/material.dart';
import 'empty_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _goToEmpty(BuildContext context, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => EmptyPage(title: title)));
  }

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
              left: 12,
              right: 12,
              bottom: 12,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _goToEmpty(context, 'Profile'),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showSearch(context: context, delegate: _SimpleSearchDelegate());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey, size: 18),
                          SizedBox(width: 8),
                          Text('Start your search', style: TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Image.asset('assets/images/maskot_rno.png', height: 70, errorBuilder: (_, __, ___) =>
                            const Icon(Icons.pets, size: 70, color: Color(0xFFF5C518))),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Welcome!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              Text('I am Revivo, the mascot\nof ReNuOil!', style: TextStyle(fontSize: 12, color: Colors.black54)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5C518),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('Seller', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () => _goToEmpty(context, 'Map'),
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/map_rno.jpeg',
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey[300],
                                child: const Center(child: Icon(Icons.map, size: 60, color: Colors.grey)),
                              ),
                            ),
                            Positioned(
                              bottom: 8, left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text('Nearest ReNuOil (1.98km)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5C518),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.bar_chart, size: 20),
                        const SizedBox(width: 8),
                        const Text('Harga RNO / Liter', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('Rp8.336*', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14, top: 4, bottom: 8),
                    child: Text('Prices may change over time*', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text('Achievement', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  GestureDetector(
                    onTap: () => _goToEmpty(context, 'Achievement'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50, height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200],
                                ),
                                child: const Icon(Icons.emoji_events, color: Color(0xFFCD7F32), size: 28),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('25.0 Liter towards Bronze 🔥', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right),
                            ],
                          ),
                          const Divider(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Collected this month:', style: TextStyle(fontSize: 12, color: Colors.black54)),
                              Text('0.00L', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Last month bonus:', style: TextStyle(fontSize: 12, color: Colors.black54)),
                              Text('Rp0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text('Promotion and offer', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  GestureDetector(
                    onTap: () => _goToEmpty(context, 'Promotion'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.card_giftcard, color: Color(0xFFF5C518), size: 24),
                          SizedBox(width: 10),
                          Text('Promotion', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          Spacer(),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text('Premium Price Bonus', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  GestureDetector(
                    onTap: () => _goToEmpty(context, 'Premium Price Bonus'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildTierCard('1', 'Gold', Colors.amber, isTop: true),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildTierCard('2', 'Silver', Colors.grey),
                              _buildTierCard('3', 'Bronze', const Color(0xFFCD7F32)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.amber[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Want to get more bonuses? Raise your level to increase your income per liter of recycled used cooking oil with our monthly premium bonus!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text('Why should you recycle ReNuOil?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  GestureDetector(
                    onTap: () => _goToEmpty(context, 'Easy Money'),
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            child: Container(
                              height: 140,
                              color: Colors.grey[300],
                              child: const Center(child: Icon(Icons.monetization_on, size: 60, color: Colors.green)),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF5C518),
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Easy Money', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                SizedBox(height: 4),
                                Text(
                                  'Reselling and making money from what you have used sounds interesting, right? So, save the used cooking oil that you have used and sell it! 🍳',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTierCard(String number, String label, Color color, {bool isTop = false}) {
    return Container(
      width: isTop ? 120 : 100,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: isTop ? 22 : 18,
            child: Text(number, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: isTop ? 18 : 15)),
          ),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: isTop ? 15 : 13)),
          const SizedBox(height: 4),
          Text(
            label == 'Gold' ? 'Bonus: 10%\n100L' : label == 'Silver' ? 'Bonus: 5%\n50L' : 'Bonus: 2.5%\n25L',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _SimpleSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
      ];

  @override
  Widget buildLeading(BuildContext context) =>
      IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) =>
      const Center(child: Text('No results found'));

  @override
  Widget buildSuggestions(BuildContext context) =>
      const Center(child: Text('Start typing to search...'));
}
