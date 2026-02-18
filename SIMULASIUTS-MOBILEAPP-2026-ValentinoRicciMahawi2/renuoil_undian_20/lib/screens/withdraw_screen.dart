import 'package:flutter/material.dart';
import 'empty_page.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  bool _withdrawAll = true;
  int _selectedBank = 0;

  void _goEmpty(BuildContext context, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => EmptyPage(title: title)));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Funding Source', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          // Refund Balance card
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9C4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFC107)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.savings, color: Color(0xFFFFC107)),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Refund Balance', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Balance: Rp0', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Withdrawal Amount
          GestureDetector(
            onTap: () => _goEmpty(context, 'Withdrawal Amount'),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFC107)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Withdrawal Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Rp.0', style: TextStyle(fontSize: 22, color: Colors.grey)),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Withdraw all balance',
                          style: TextStyle(color: Color(0xFF6A3DE8), decoration: TextDecoration.underline)),
                      Switch(
                        value: _withdrawAll,
                        onChanged: (v) => setState(() => _withdrawAll = v),
                        activeColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text('Select Bank Destination', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('Your withdrawal of funds will be transferred to the selected destination account',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),

          // BCA bank
          GestureDetector(
            onTap: () => setState(() => _selectedBank = 0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _selectedBank == 0 ? Colors.blue : Colors.grey[200]!),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('BCA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('5147 8816 8499 7303', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Name : Matt', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      _selectedBank == 0 ? Icons.check_circle : Icons.circle_outlined,
                      color: _selectedBank == 0 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // OCBC bank
          GestureDetector(
            onTap: () => setState(() => _selectedBank = 1),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _selectedBank == 1 ? Colors.red : Colors.grey[200]!),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                    child: Icon(
                      _selectedBank == 1 ? Icons.check_circle : Icons.circle_outlined,
                      color: _selectedBank == 1 ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Add New Bank Account
          GestureDetector(
            onTap: () => _goEmpty(context, 'Add New Bank Account'),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              alignment: Alignment.center,
              child: const Text('Add New Bank Account',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
            ),
          ),
          const SizedBox(height: 8),

          // Withdraw Balance button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _goEmpty(context, 'Withdraw Balance'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Withdraw Balance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
