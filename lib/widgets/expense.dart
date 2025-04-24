import 'package:flutter/material.dart';
import 'package:input_data/widgets/expenses_list/expenses_list.dart';
import 'package:input_data/widgets/new_expenses.dart';
import 'package:input_data/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Nairobi',
      amount: 1900000.00,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 2588,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Eater',
      amount: 18869.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Pilau',
      amount: 150,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  // Function to handle new expense
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: NewExpense(onAddExpense: _addExpense),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
