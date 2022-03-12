import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plan/models/PlanModel.dart';
import 'package:plan/widgets/new_plan.dart';
import 'widgets/date.dart';
import 'widgets/DonePlans.dart';
import 'widgets/plans.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: const PlanApp(),
    );
  }
}

class PlanApp extends StatefulWidget {
  const PlanApp({Key? key}) : super(key: key);

  @override
  State<PlanApp> createState() => _PlanAppState();
}

class _PlanAppState extends State<PlanApp> {
  final List<PlanModels> _plan = modelPlans().modelPlan;
  // ignore: non_constant_identifier_names
  DateTime _ChosenDay = DateTime.now();
  // ignore: non_constant_identifier_names
  void Calendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then(
      // ignore: non_constant_identifier_names
      (ChosenDate) => {
        if (ChosenDate != null)
          {
            setState(
              () {
                _ChosenDay = ChosenDate;
              },
            ),
          },
      },
    );
  }

  // ignore: non_constant_identifier_names
  void _BeforDay() {
    setState(() {
      _ChosenDay = DateTime(
        _ChosenDay.year,
        _ChosenDay.month,
        _ChosenDay.day - 1,
      );
    });
  }

  // ignore: non_constant_identifier_names
  void _AfterDay() {
    setState(() {
      _ChosenDay = DateTime(
        _ChosenDay.year,
        _ChosenDay.month,
        _ChosenDay.day + 1,
      );
    });
  }

  // ignore: non_constant_identifier_names
  void _DoneButton(String planID) {
    setState(() {
      _plan.firstWhere((doneplan) => doneplan.id == planID).ChangeDone();
    });
  }

  // ignore: non_constant_identifier_names
  void _DeleteButton(String planID) {
    setState(() {
      _plan.removeWhere((planRemove) => planRemove.id == planID);
    });
  }

  // ignore: non_constant_identifier_names
  void _Addplan(String planName, DateTime planDay) {
    // ignore: avoid_print
    print(planName);
    // ignore: avoid_print
    print(planDay);
  }

  // ignore: non_constant_identifier_names
  void _PlanAdded(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewPlan(_Addplan);
      },
    );
  }

  // ignore: non_constant_identifier_names
  int get _DPlansLength {
    return _plan.where((dplan) => dplan.isDone).length;
  }

  // ignore: non_constant_identifier_names
  int get _APlansLength {
    return _plan.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Plan App'),
      ),
      body: Column(
        children: [
          date(
            Calendar,
            _ChosenDay,
            _BeforDay,
            _AfterDay,
          ),
          DonePlans(_APlansLength, _DPlansLength),
          plans(
            _plan,
            _DoneButton,
            _DeleteButton,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _PlanAdded(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
