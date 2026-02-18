import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'balance_screen.dart';
import 'withdraw_screen.dart';
import 'pickup_screen.dart';
import 'qrcode_screen.dart';
import 'history_screen.dart';
import 'empty_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    BalanceScreen(),
    WithdrawScreen(),
    PickupScreen(),
    QRCodeScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top search + profile bar (yellow background)
          Container(
            color: const Color(0xFFFFC107),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 12,
              right: 12,
              bottom: 8,
            ),
            child: Row(
              children: [
                // Profile picture
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EmptyPage(title: 'Profile'))),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage('assets/images/ricci_ai_photo.jpeg'),
                  ),
                ),
                const SizedBox(width: 10),
                // Search bar
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: _SimpleSearchDelegate());
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey, size: 20),
                          SizedBox(width: 8),
                          Text('Start your search', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Navbar
          Container(
            color: const Color(0xFFFFC107),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(icon: Icons.home, label: 'Home', index: 0, selectedIndex: _selectedIndex, onTap: (i) => setState(() => _selectedIndex = i)),
                _NavItem(icon: Icons.account_balance_wallet, label: 'Balance', index: 1, selectedIndex: _selectedIndex, onTap: (i) => setState(() => _selectedIndex = i)),
                _NavItem(icon: Icons.download, label: 'Withdraw', index: 2, selectedIndex: _selectedIndex, onTap: (i) => setState(() => _selectedIndex = i)),
                _NavItem(icon: Icons.local_shipping, label: 'Pick Up', index: 3, selectedIndex: _selectedIndex, onTap: (i) => setState(() => _selectedIndex = i)),
                _NavItem(icon: Icons.qr_code, label: 'QR Code', index: 4, selectedIndex: _selectedIndex, onTap: (i) => setState(() => _selectedIndex = i)),
                _NavItem(icon: Icons.history, label: 'History', index: 5, selectedIndex: _selectedIndex, onTap: (i) => setState(() => _selectedIndex = i)),
              ],
            ),
          ),
          // Page content
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? Colors.black : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: selected ? Colors.black : Colors.black54),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? Colors.black : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => const Center(child: Text('No results'));

  @override
  Widget buildSuggestions(BuildContext context) => const Center(child: Text('Search ReNuOil...'));
}
