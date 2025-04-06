void main() {
  List<Map<String, dynamic>> students = [
    {
      "name": "Alice",
      "scores": [85, 90, 78],
    },
    {
      "name": "Bob",
      "scores": [88, 76, 95],
    },
    {
      "name": "Charlie",
      "scores": [90, 92, 85],
    },
  ];

  Map<String, double> stuAverages = {};

  for (var student in students) {
    String name = student["name"];
    List<int> points = student["scores"];

    int sum = 0;
    for (int point in points) {
      sum += point;
    }

    double avg = sum / points.length;
    double revAverage = double.parse(avg.toStringAsFixed(2));

    stuAverages[name] = revAverage;
  }

  var sorted =
      stuAverages.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

  Map<String, double> sortedAvg = {};
  print("{");
  for (var e in sorted) {
    sortedAvg[e.key] = e.value;
  }
  for (var e in sortedAvg.entries) {
    print('  "${e.key}": ${e.value},');
  }
  print("}");
}
