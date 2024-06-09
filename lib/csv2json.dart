/// A package to convert CSV data to JSON format.
///
/// This package provides functionality to convert CSV data represented as strings
/// or files into JSON format. It trims spaces from headers and values to ensure
/// clean and consistent JSON output.
library csv2json;

import 'dart:convert';
import 'dart:io';
import 'dart:async';

/// Converts CSV data to JSON format.
///
/// The input CSV string should have the first row as headers.
/// Each row is converted to a map, where the keys are the column headers.
///
/// Example:
/// ```dart
/// final csvData = 'name,age\nAlice,30\nBob,25';
/// final jsonData = csv2json(csvData);
/// print(jsonData); // [{'name': 'Alice', 'age': '30'}, {'name': 'Bob', 'age': '25'}]
/// ```
List<Map<String, String>> csv2json(String csv) {
  List<String> lines = csv.split('\n');
  if (lines.isEmpty) {
    return [];
  }

  List<String> headers =
      lines.first.split(',').map((header) => header.trim()).toList();
  List<Map<String, String>> jsonList = [];

  lines.skip(1).forEach((line) {
    List<String> values = _splitCsvLine(line);
    if (values.length == headers.length) {
      jsonList.add(Map<String, String>.fromIterables(headers, values));
    } else {
      print(
          'Skipping row: $line. Number of values does not match number of headers.');
    }
  });

  return jsonList;
}

List<String> _splitCsvLine(String line) {
  List<String> values = [];
  bool inQuotes = false;
  StringBuffer buffer = StringBuffer();

  for (int i = 0; i < line.length; i++) {
    String char = line[i];
    if (char == '"') {
      inQuotes = !inQuotes;
    } else if (char == ',' && !inQuotes) {
      values.add(buffer.toString().trim());
      buffer.clear();
    } else {
      buffer.write(char);
    }
  }

  values.add(buffer.toString().trim());
  return values;
}

/// Reads a CSV file from the given file path and converts its content to JSON format.
///
/// Example:
/// ```dart
/// final jsonData = await csvFileToJson('assets/data.csv');
/// print(jsonData);
/// ```
Future<List<Map<String, String>>> csvFileToJson(String filePath) async {
  try {
    final file = File(filePath);
    String csvContent = await file.readAsString();
    return csv2json(csvContent);
  } catch (e) {
    print('Error reading CSV file: $e');
    return [];
  }
}

/// Writes JSON data to a file.
///
/// Example:
/// ```dart
/// await writeJsonToFile(jsonData, 'output.json');
/// ```
Future<void> writeJsonToFile(
    List<Map<String, String>> jsonData, String filePath) async {
  final file = File(filePath);
  await file.writeAsString(json.encode(jsonData));
}

/// Converts CSV data to JSON format and writes it to a file.
///
/// The input [csv] string should have the first row as headers.
/// Each row is converted to a map, where the keys are the column headers.
///
/// Example:
/// ```dart
/// final csvData = 'name,age\nAlice,30\nBob,25';
/// csvToJsonFile(csvData, 'output.json');
/// ```
Future<void> csvToJsonFile(String csv, String outputFilePath) async {
  final jsonData = csv2json(csv);
  await writeJsonToFile(jsonData, outputFilePath);
}
