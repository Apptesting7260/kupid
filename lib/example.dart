// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
//
//
// class CountrySelectionWidget extends StatefulWidget {
//   @override
//   _CountrySelectionWidgetState createState() => _CountrySelectionWidgetState();
// }
//
// class _CountrySelectionWidgetState extends State<CountrySelectionWidget> {
//   final Map<String, String> countryData = {
//     'United States': 'assets/flags/us_flag.png',
//     'Canada': 'assets/flags/canada_flag.png',
//   };
//
//   String selectedCountry = '';
//   TextEditingController _typeAheadController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TypeAheadFormField(
//           textFieldConfiguration: TextFieldConfiguration(
//             controller: _typeAheadController,
//             decoration: InputDecoration(labelText: 'Select a country'),
//           ),
//           suggestionsCallback: (pattern) {
//             return countryData.keys.where((country) =>
//                 country.toLowerCase().contains(pattern.toLowerCase()));
//           },
//           itemBuilder: (context, suggestion) {
//             return ListTile(
//               title: Text(suggestion),
//               leading: Image.asset(countryData[suggestion]!),
//             );
//           },
//           onSuggestionSelected: (suggestion) {
//             _typeAheadController.text = suggestion;
//             setState(() {
//               selectedCountry = suggestion;
//             });
//           },
//         ),
//         SizedBox(height: 16),
//         Text('Selected Country: $selectedCountry'),
//       ],
//     );
//   }
// }
//
