import 'package:flutter/material.dart';
import 'package:plan/models/PlanModel.dart';
import 'planss.dart';

// ignore: camel_case_types
class plans extends StatelessWidget {
  final List<PlanModels> plan;
  // ignore: non_constant_identifier_names
  final Function DoneButton;
  // ignore: non_constant_identifier_names
  final Function _DeleteButton;
  // ignore: use_key_in_widget_constructors
  const plans(this.plan, this.DoneButton, this._DeleteButton);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return planns(plan[index], DoneButton, _DeleteButton);
        }),
        itemCount: plan.length,
      ),
    );
  }
}
