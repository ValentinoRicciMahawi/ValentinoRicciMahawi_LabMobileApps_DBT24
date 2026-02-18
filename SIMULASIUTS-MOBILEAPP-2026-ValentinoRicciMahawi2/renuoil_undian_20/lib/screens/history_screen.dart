import 'package:flutter/material.dart';
import 'empty_page.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _tab = 0; // 0 = RNO Deposit, 1 = Withdrawal

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sub-navbar
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _tab = 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _tab == 0 ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'RNO Deposit',
                      style: TextStyle(
                        fontWeight: _tab == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _tab = 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _tab == 1 ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Withdrawal',
                      style: TextStyle(
                        fontWeight: _tab == 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Content
        Expanded(
          child: _tab == 0 ? _buildDepositTab() : _buildWithdrawalTab(),
        ),
      ],
    );
  }

  Widget _buildDepositTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Which Bank do you want to use?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          // BCA
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('BCA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('5147 8816 8499 7303', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 4),
                    Text('Name : Matt', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Positioned(
                  right: 0,
                  top: 0,
                  child: Icon(Icons.check_circle, color: Colors.blue),
                ),
              ],
            ),
          ),
          // OCBC
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('OCBC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('8428 1945 1234 8888', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 4),
                    Text('Name : Matt', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Icon(Icons.check_circle, color: Colors.red),
                ),
              ],
            ),
          ),

          // History label
          const Center(
            child: Text('History',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 24),

          _historyItem('From BCA', '2024-02-07 18:55', '+Rp 26.000', true),
          const Divider(),
          _historyItem('From OCBC', '2024-02-07 18:55', '+Rp 47.000', true),
          const Divider(),
          _historyItem('From BCA', '2024-02-08 19:20', '+Rp 38.000', true),
        ],
      ),
    );
  }

  Widget _buildWithdrawalTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Wallet card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9C4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFFC107)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('RNO Wallet', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('Rp 355.000,00',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text('Withdraw'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 24),

          _historyItemTyped('Cashback', '2025-01-05 18:32', '+Rp 27.000', false),
          const Divider(),
          _historyItemTyped('Cooking Oil', '2024-02-07 18:55', '+Rp 49.000', true),
          const Divider(),
          _historyItemTyped('Chef Oil', '2024-02-08 19:20', '+Rp 37.000', true),
        ],
      ),
    );
  }

  Widget _historyItem(String title, String date, String amount, bool success) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('Succes', style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }

  Widget _historyItemTyped(String title, String date, String amount, bool success) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: success ? Colors.black : Colors.grey[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        success ? 'Succes' : 'Pending',
                        style: const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }
}
