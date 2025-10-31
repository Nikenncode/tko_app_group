final List<Map<String, String>> history = [
  {"date": "06-09-2025", "points": "+42", "amount": "\$42.90"},
  {"date": "11-09-2025", "points": "+200", "amount": "\$200.01"},
  {"date": "18-09-2025", "points": "+85", "amount": "\$85.85"},
  {"date": "30-09-2025", "points": "+112", "amount": "\$112.40"},
  {"date": "20-10-2025", "points": "+47", "amount": "\$47.62"},
  {"date": "24-10-2025", "points": "+30", "amount": "\$30.12"},
];

int calculateTotalPoints() {
  return history.fold<int>(
    0,
        (sum, item) => sum + int.parse(item["points"]!.replaceAll("+", "")),
  );
}
