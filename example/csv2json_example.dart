import 'package:csv2json/csv2json.dart';
import 'dart:async';

Future<void> main() async {
  final csvData = 'name,age\nAlice,30\nBob,25';
  final jsonData = csv2json(csvData);
  print('CSV to JSON:');
  print(
      jsonData); // [{'name': 'Alice', 'age': '30'}, {'name': 'Bob', 'age': '25'}]

  final filePath = 'example/mock_datas.csv';
  final jsonFileData = await csvFileToJson(filePath);
  print('CSV File to JSON:');
  print(jsonFileData); // [{name: John Doe, age: 30}, {name: Jane Doe, age: 25}]

  final inputData = 'name,age\nAlice,30\nBob,25';
  final outputFilePath = 'example/output.json';

  await csvToJsonFile(inputData, outputFilePath);
  print('CSV data converted to JSON and written to $outputFilePath');
}
