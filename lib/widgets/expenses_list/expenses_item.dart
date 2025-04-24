import 'package:flutter/material.dart';
import 'package:input_data/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  // Define a map of category icons
  static const categoryIcons = {
    Category.food: Icons.restaurant,
    Category.travel: Icons.travel_explore,
    Category.leisure: Icons.movie,
    Category.work: Icons.work,
  };

  @override
  Widget build(BuildContext context) {
    // Format date
    String formattedDate = '${expense.date.day}/${expense.date.month}/${expense.date.year}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ksh ${expense.amount.toStringAsFixed(2)}'),
                Icon(categoryIcons[expense.category]),
                Text(formattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
