import 'package:flutter/material.dart';

const List<String> _defaultListItem = <String>[
  'Chinese',
  'Spanish',
  'English',
  'Hindi',
  'Arabic',
  'Portuguese',
  'Bengali',
  'Russian',
  'German',
  'Korean',
  'French',
  'Telugu',
  'Marathi',
  'Tamil',
  'Urdu',
  'Gujarati',
  'Malayalam',
  'Odia',
  'Punjabi',
  'Maithili',
];

class FilterChipScreen extends StatefulWidget {
  @override
  _FilterChipState createState() => _FilterChipState();
}

class _FilterChipState extends State<FilterChipScreen> {
  final Set<String> _list = <String>{};
  final Set<String> _selectedFilter = <String>{};

  _FilterChipState() {
    _list.clear();
    _list.addAll(_defaultListItem);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> filterChips =
        _defaultListItem.map<Widget>((String name) {
      return FilterChip(
        key: ValueKey<String>(name),
        label: Text(name),
        selected: _list.contains(name) ? _selectedFilter.contains(name) : false,
        onSelected: !_list.contains(name)
            ? null
            : (bool value) {
                setState(() {
                  if (!value) {
                    _selectedFilter.remove(name);
                  } else {
                    _selectedFilter.add(name);
                  }
                });
              },
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Chip", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Select Specialities",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            Wrap(
                children: filterChips.map<Widget>((Widget chip) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: chip,
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
