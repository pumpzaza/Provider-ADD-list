import 'package:expense_tracker_provider/models/my_transaction.dart';
import 'package:expense_tracker_provider/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
class AddEditScreen extends StatefulWidget {
  static const routeName = '/add-edit';
  const AddEditScreen({super.key});
 
  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}
 
class _AddEditScreenState extends State<AddEditScreen> {
 
 
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
 
  void _insert() async {
    // เรียกใช้เมธอด insert
    await context.read<TransactionProvider>().addMyTransaction(
      _titleController.text,
      double.parse(_amountController.text),  
      DateTime.now(),
      TransactionType.income,
      );
   
    // เคลียร์ TextField หลังจากเพิ่มข้อมูล
    _titleController.clear();
    _amountController.clear();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite C.R.U.D. Lab')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _insert,
              child: const Text('Insert Note'),
            ),
            // พื้นที่สำหรับแสดงผล (จะเพิ่มในขั้นตอนถัดไป)
          ],
        ),
      ),
    );
  }
}