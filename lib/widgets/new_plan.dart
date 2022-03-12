import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPlan extends StatefulWidget {
  final Function addPlan;
  // ignore: use_key_in_widget_constructors
  const NewPlan(this.addPlan);
  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  // ignore: non_constant_identifier_names
  DateTime? _ForChooseDay;
  final _nameOfController = TextEditingController();
  // ignore: non_constant_identifier_names
  void ForChooseDay(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      // ignore: non_constant_identifier_names
    ).then((ChoosingDay) => {
          if (ChoosingDay != null)
            setState(() {
              _ForChooseDay = ChoosingDay;
            }),
        });
  }

  // ignore: non_constant_identifier_names
  void Submit() {
    if (_nameOfController.text.isEmpty || _ForChooseDay == null) {
      return;
    }
    widget.addPlan(_nameOfController.text, _ForChooseDay);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _nameOfController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _ForChooseDay == null
                    ? " Planing day don't chosed"
                    : DateFormat("EEEE, d MMMM, yyyy").format(_ForChooseDay!),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  ForChooseDay(context);
                },
                child: const Text(
                  'CHOOSE DATE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'CANCEL',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: Submit,
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
