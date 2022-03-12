// ignore_for_file: file_names

class PlanModels {
  final String id;
  final String name;
  final DateTime date;
  bool isDone = false;

  PlanModels({required this.id, required this.name, required this.date});

  // ignore: non_constant_identifier_names
  void ChangeDone() {
    isDone = !isDone;
  }
}

// ignore: camel_case_types
class modelPlans {
  // ignore: prefer_final_fields
  List<PlanModels> _modelPlan = [
    PlanModels(
      id: "a1",
      name: "Go to the Shop",
      date: DateTime.now(),
    ),
    PlanModels(
      id: "a2",
      name: "Read a Book",
      date: DateTime.now(),
    ),
    PlanModels(
      id: "a3",
      name: "Learn the Flutter",
      date: DateTime.now(),
    ),
  ];

  List<PlanModels> get modelPlan {
    return _modelPlan;
  }
}
