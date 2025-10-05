// lib/main.dart (ชั่วคราวสำหรับทดสอบ)
import 'package:expense_tracker_provider/screens/add_edit_screen.dart';
import 'package:expense_tracker_provider/screens/transaction_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/transaction_provider.dart';
import 'models/my_transaction.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      initialRoute: TransactionListScreen.routeName,
      routes: {
        TransactionListScreen.routeName: (context) => const TransactionListScreen(),
        AddEditScreen.routeName: (context) => const AddEditScreen()
      } // เปลี่ยนเป็นหน้าจอหลัก
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Insert')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('Inserting test data...');
            context.read<TransactionProvider>().addMyTransaction(
              'เงินเดือน',
              20000.0,
              DateTime.now(),
              TransactionType.income,
            );
          },
          child: const Text('Add Test Income'),
        ),
      ),
    );
  }
}
