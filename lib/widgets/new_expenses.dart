import 'package:flutter/material.dart';
import 'package:input_data/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;

  void _submitExpenseData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount == null || enteredAmount <= 0) {
      return;
    }

    final newExpense = Expense(
      title: enteredTitle,
      amount: enteredAmount,
      date: DateTime.now(),
      category: _selectedCategory,
    );

    widget.onAddExpense(newExpense);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Amount'),
        ),
        DropdownButton<Category>(
          value: _selectedCategory,
          items: Category.values.map((cat) {
            return DropdownMenuItem(
              value: cat,
              child: Text(cat.name.toUpperCase()),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              if (val != null) _selectedCategory = val;
            });
          },
          isExpanded: true,
        ),
        ElevatedButton(
          onPressed: _submitExpenseData,
          child: const Text('Save Expense'),
        ),
      ],
    );
  }
}
