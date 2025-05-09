import 'package:input_data/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:input_data/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => ExpenseItem(expenses[index]));
  }
}
