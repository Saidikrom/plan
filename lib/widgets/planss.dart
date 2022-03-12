import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plan/models/PlanModel.dart';

// ignore: camel_case_types
class planns extends StatelessWidget {
  final PlanModels plan;
  // ignore: non_constant_identifier_names
  final Function DoneButton;
  // ignore: non_constant_identifier_names
  final Function _DeleteButton;
  // ignore: use_key_in_widget_constructors
  const planns(this.plan, this.DoneButton, this._DeleteButton);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          DoneButton(plan.id);
        },
        icon: Icon(
          plan.isDone ? Icons.check_circle_outlined : Icons.circle_outlined,
          color: plan.isDone
              ? const Color.fromARGB(255, 97, 224, 101)
              : Colors.grey,
        ),
      ),
      title: Text(
        plan.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          color: plan.isDone ? Colors.grey : Colors.black,
          decoration:
              plan.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          _DeleteButton(plan.id);
        },
        icon: const Icon(
          Icons.delete_forever_rounded,
        ),
      ),
    );
  }
}
