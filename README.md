<p align="center">

<img alt="Static Badge" src="https://img.shields.io/badge/Test-passing-brightgreen?style=for-the-badge">

<img alt="Static Badge" src="https://img.shields.io/badge/Licence-BSD%203%20Clause-brightgreen?style=for-the-badge">

<img alt="Static Badge" src="https://img.shields.io/badge/Code%20Size-4%20KB-brightgreen?style=for-the-badge">

<img alt="Static Badge" src="https://img.shields.io/badge/Coverage-%20100%25%20-brightgreen?style=for-the-badge">

</p>

````markdown
# csv2json

csv2json is a Dart package designed to simplify the
process of converting Comma-Separated Values (CSV) data
to JavaScript Object Notation (JSON) format. It provides
a clean and efficient solution for handling CSV data in
Dart applications.

## Supported Platforms

csv2json is compatible with the following platforms:

- Flutter: Works seamlessly with Flutter for building cross-platform mobile, web, and desktop applications.
- Dart: Can be used with standalone Dart projects for server-side scripting, command-line tools, web applications, and more.
- Web: Supports web applications, including both Flutter web projects and standalone Dart web applications.
- Mobile: Compatible with iOS and Android platforms for mobile application development.
- Desktop: Works for desktop applications targeting Windows, macOS, and Linux platforms.
- Server: Suitable for server-side development, including backend services and APIs written in Dart.

## Features

- CSV to JSON Conversion: Convert CSV data to JSON format effortlessly.
- Trimming: Automatically trim spaces from headers and values to ensure clean and consistent JSON output.
- File Support: Read CSV data directly from files and convert it to JSON with ease.

## Installation

To use csv2json in your Dart project, add it as a dependency in your pubspec.yaml file:

```yaml
dependencies:
  csv2json: ^1.0.0
```
````

Then, run `flutter pub get` to install the package.

## Usage

### Converting CSV Data to JSON

To convert CSV data to JSON, use the csv2json function:

```dart
import 'package:csv2json/csv2json.dart';

void main() {
  final csvData = 'name,age\nAlice,30\nBob,25';
  final jsonData = csv2json(csvData);
  print(jsonData);
}
```

### Converting CSV File to JSON

To convert CSV data from a file to JSON, use the csvFileToJson function:

```dart
import 'package:csv2json/csv2json.dart';

void main() async {
  final filePath = 'path/to/your/csv/file.csv';
  final jsonData = await csvFileToJson(filePath);
  print(jsonData);
}
```

### Writing JSON Data to File

To write JSON data to a file, use the writeJsonToFile function:

```dart
import 'package:csv2json/csv2json.dart';

void main() async {
  final jsonData = [{'name': 'Alice', 'age': '30'}, {'name': 'Bob', 'age': '25'}];
  final filePath = 'output.json';
  await writeJsonToFile(jsonData, filePath);
  print('JSON data written to $filePath');
}
```

### Converting CSV Data to JSON and Writing to File

To convert CSV data to JSON and write it to a file, use the csvToJsonFile function:

```dart
import 'package:csv2json/csv2json.dart';

void main() async {
  final csvData = 'name,age\nAlice,30\nBob,25';
  final outputFilePath = 'output.json';

  await csvToJsonFile(csvData, outputFilePath);
  print('CSV data converted to JSON and written to $outputFilePath');
}
```

For more detailed information on usage and additional features, refer to the [API documentation](https://pub.dev/documentation/csv2json/latest/).

## Example

Check out the example directory in the [CSV TO JSON](https://github.com/Colin-Stark/csv2json) for a complete example demonstrating the usage of csv2json package.

## License

This package is licensed under the [BSD-3-Clause](LICENSE).
