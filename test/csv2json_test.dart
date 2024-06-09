import 'package:test/test.dart';
import 'package:csv2json/csv2json.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  group('CsvToJson', () {
    test('csv2json with standard CSV', () {
      final csvData = 'name,age\nAlice,30\nBob,25';
      final expectedJson = [
        {'name': 'Alice', 'age': '30'},
        {'name': 'Bob', 'age': '25'},
      ];

      expect(csv2json(csvData), expectedJson);
    });

    test('csv2json with empty CSV', () {
      final csvData = '';
      final expectedJson = [];

      expect(csv2json(csvData), expectedJson);
    });

    test('csv2json with no data rows', () {
      final csvData = 'name,age';
      final expectedJson = [];

      expect(csv2json(csvData), expectedJson);
    });

    test('csv2json with extra spaces', () {
      final csvData = ' name , age \n Alice , 30 \n Bob , 25 ';
      final expectedJson = [
        {'name': 'Alice', 'age': '30'},
        {'name': 'Bob', 'age': '25'},
      ];

      expect(csv2json(csvData), expectedJson);
    });

    test('csv2json with inconsistent spacing', () {
      final csvData = 'name , age\nAlice, 30\n Bob ,25';
      final expectedJson = [
        {'name': 'Alice', 'age': '30'},
        {'name': 'Bob', 'age': '25'},
      ];

      expect(csv2json(csvData), expectedJson);
    });

    test('csv2json with multiline values', () {
      final csvData =
          'name,description\nAlice,"loves programming"\nBob,"enjoys, sports"';
      final expectedJson = [
        {'name': 'Alice', 'description': 'loves programming'},
        {'name': 'Bob', 'description': 'enjoys, sports'},
      ];

      expect(csv2json(csvData), expectedJson);
    });

    test('csvFileToJson reads and converts file correctly', () async {
      final filePath = 'test/assets/mock_data.csv';
      final expectedJson = [
        {'name': 'Alice', 'age': '30'},
        {'name': 'Bob', 'age': '25'},
      ];

      expect(await csvFileToJson(filePath), expectedJson);
    });

    test('csvFileToJson handles non-existent file', () async {
      final filePath = 'test/assets/non_existent.csv';
      final expectedJson = [];

      expect(await csvFileToJson(filePath), expectedJson);
    });
  });

  group('CsvToJsonFile', () {
    test('csvToJsonFile converts CSV data to JSON and writes to file correctly',
        () async {
      final csvData = 'name,age\nAlice,30\nBob,25';
      final outputFilePath = 'test/assets/output.json';

      await csvToJsonFile(csvData, outputFilePath);

      final outputFile = File(outputFilePath);
      expect(await outputFile.exists(), isTrue);

      final outputJsonData = await outputFile.readAsString();

      // Parse both actual and expected JSON strings
      final actualJson = json.decode(outputJsonData);
      final expectedJson = [
        {'name': 'Alice', 'age': '30'},
        {'name': 'Bob', 'age': '25'},
      ];

      // Compare the parsed JSON objects
      expect(actualJson, expectedJson);
    });
  });
}
