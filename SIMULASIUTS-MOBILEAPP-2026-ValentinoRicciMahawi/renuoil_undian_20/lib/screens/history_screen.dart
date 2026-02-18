import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorWeight: 2,
              tabs: const [
                Tab(text: 'RNO Deposit'),
                Tab(text: 'Withdrawal'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildRNODepositTab(),
                _buildWithdrawalTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRNODepositTab() {
    final banks = [
      {'bank': 'BCA', 'number': '5147 8816 8499 7303', 'name': 'Matt', 'selected': true},
      {'bank': 'OCBC', 'number': '8428 1945 1234 8888', 'name': 'Matt', 'selected': false},
    ];

    final history = [
      {'from': 'From BCA', 'amount': '+Rp 26.000', 'date': '2024-02-07 18:55'},
      {'from': 'From OCBC', 'amount': '+Rp 47.000', 'date': '2024-02-07 18:55'},
      {'from': 'From BCA', 'amount': '+Rp 38.000', 'date': '2024-02-08 19:20'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Which Bank do you want to use?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 10),

          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('BCA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 4),
                      Text('5147 8816 8499 7303', style: TextStyle(fontSize: 13)),
                      SizedBox(height: 4),
                      Text('Name : Matt', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.check_circle, color: Colors.blue),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red[200]!),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('OCBC', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 4),
                      Text('8428 1945 1234 8888', style: TextStyle(fontSize: 13)),
                      SizedBox(height: 4),
                      Text('Name : Matt', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.check_circle, color: Colors.red[400]),
                ),
              ],
            ),
          ),

          const Center(
            child: Column(
              children: [
                Text('History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 4),
                Divider(),
              ],
            ),
          ),

          ...history.map((item) => Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(item['from']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text('Succes', style: TextStyle(color: Colors.white, fontSize: 11)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(item['date']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Text(item['amount']!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildWithdrawalTab() {
    final history = [
      {'type': 'Cashback', 'status': 'Pending', 'statusColor': true, 'amount': '+Rp 27.000', 'date': '2025-01-05 18:32'},
      {'type': 'Cooking Oil', 'status': 'Succes', 'statusColor': false, 'amount': '+Rp 49.000', 'date': '2024-02-07 18:55'},
      {'type': 'Chef Oil', 'status': 'Succes', 'statusColor': false, 'amount': '+Rp 37.000', 'date': '2024-02-08 19:20'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5C518),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('RNO Wallet', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Text('Rp 355.000,00', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Withdraw', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const Center(
            child: Column(
              children: [
                Text('History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Divider(),
              ],
            ),
          ),
          const SizedBox(height: 8),

          ...history.map((item) => Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(item['type'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: (item['statusColor'] as bool) ? Colors.grey[800] : Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(item['status'] as String, style: const TextStyle(color: Colors.white, fontSize: 11)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(item['date'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Text(item['amount'] as String, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}
