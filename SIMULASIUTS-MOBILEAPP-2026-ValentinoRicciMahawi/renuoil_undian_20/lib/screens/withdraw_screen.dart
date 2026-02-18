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

  void _goEmpty(String title) {
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
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select Funding Source', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5C518).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFF5C518)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.download, color: Color(0xFFF5C518)),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Refund Balance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Text('Balance: Rp0', style: TextStyle(fontSize: 12, color: Colors.black54)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  GestureDetector(
                    onTap: () => _goEmpty('Withdrawal Amount'),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5C518).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFF5C518)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Withdrawal Amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(height: 8),
                          const Text('Rp.0', style: TextStyle(fontSize: 22, color: Colors.black38, fontWeight: FontWeight.bold)),
                          const Divider(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Withdraw all balance', style: TextStyle(color: Color(0xFF4444FF), fontSize: 13)),
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
                  const SizedBox(height: 16),

                  const Text('Select Bank Destination', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  const Text(
                    'Your withdrawal of funds will be transferred to the selected destination account',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 12),

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
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('BCA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                SizedBox(height: 4),
                                Text('5147 8816 8499 7303', style: TextStyle(fontSize: 14)),
                                SizedBox(height: 4),
                                Text('Name : Matt', style: TextStyle(fontSize: 12, color: Colors.black54)),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                              color: _selectedBank == 0 ? Colors.blue[100] : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.check_circle,
                              color: _selectedBank == 0 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

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
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('OCBC', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                SizedBox(height: 4),
                                Text('8428 1945 1234 8888', style: TextStyle(fontSize: 14)),
                                SizedBox(height: 4),
                                Text('Name : Matt', style: TextStyle(fontSize: 12, color: Colors.black54)),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                              color: _selectedBank == 1 ? Colors.red[100] : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.check_circle,
                              color: _selectedBank == 1 ? Colors.red : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => _goEmpty('Add New Bank Account'),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: const Center(
                        child: Text('Add New Bank Account', style: TextStyle(color: Color(0xFF4444FF), fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () => _goEmpty('Withdraw Confirmation'),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5C518),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Withdraw Balance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
}
