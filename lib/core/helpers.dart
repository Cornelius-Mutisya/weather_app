import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helpers {
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  }

  static formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date.split(' ')[0]);
    // Format date to show Day of the week, Month, Day of the month
    final String formattedDate = DateFormat('E, MMM d').format(dateTime);

    return formattedDate;
  }
}
