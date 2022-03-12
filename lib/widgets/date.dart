import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class date extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Function Calendar;
  // ignore: non_constant_identifier_names
  final DateTime ChosenDay;
  // ignore: non_constant_identifier_names
  final Function() BeforDay;
  // ignore: non_constant_identifier_names
  final Function() AfterDay;
  // ignore: use_key_in_widget_constructors
  const date(this.Calendar, this.ChosenDay, this.BeforDay, this.AfterDay);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: BeforDay,
          icon: const Icon(Icons.arrow_left),
          iconSize: 40,
        ),
        TextButton(
          onPressed: () {
            Calendar(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 25,
              ),
              children: [
                TextSpan(
                    text: '${DateFormat.EEEE().format(ChosenDay)}, ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: DateFormat('d MMM').format(ChosenDay)),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: AfterDay,
          icon: const Icon(
            Icons.arrow_right,
          ),
          iconSize: 40,
        ),
      ],
    );
  }
}
