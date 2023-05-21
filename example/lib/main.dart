// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:club_buttons/club_buttons.dart';

void main() => runApp(const GroupedButtonExample());

class GroupedButtonExample extends StatelessWidget {
  const GroupedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Club Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _checked = [
    "Apple",
    "Banana",
  ];
  String _picked = "Date";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Club Buttons Example"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: <Widget>[
        // SIMPLE USAGE EXAMPLE
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: const Text(
            "Basic CheckboxGroup",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        CheckboxGroup(
          labels: const <String>[
            "Apple",
            "Cranberry",
            "Date",
            "Elderberry",
            "Fig",
            "Grape",
          ],
          disabled: const ["Cranberry", "Fig"],
          onChange: (bool isChecked, String label, int index) =>
              print("isChecked: $isChecked   label: $label  index: $index"),
          onSelected: (List<String> checked) =>
              print("checked: ${checked.toString()}"),
          activeColor: Colors.red,
        ),

        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: const Text(
            "Basic RadioButtonGroup",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        RadioButtonGroup(
          labels: const [
            "Apple",
            "Banana",
          ],
          disabled: const ["Apple"],
          onChange: (String label, int index) =>
              print("label: $label index: $index"),
          onSelected: (String label) => print(label),
          activeColor: Colors.red,
        ),

        // CUSTOM USAGE EXAMPLE

        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
          child: const Text(
            "Custom CheckboxGroup",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        CheckboxGroup(
          orientation: GroupedButtonsOrientation.horizontal,
          margin: const EdgeInsets.only(left: 12.0),
          onSelected: (List<String> selected) => setState(() {
            _checked = selected;
          }),
          labels: const <String>[
            "Apple",
            "Banana",
            "Cranberry",
            "Date",
          ],
          checked: _checked,
          itemBuilder: (Checkbox cb, Text txt, int i) {
            return Column(
              children: <Widget>[
                const Icon(Icons.polymer),
                cb,
                txt,
              ],
            );
          },
          activeColor: Colors.black,
        ),

        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
          child: const Text(
            "Custom RadioButtonGroup",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        RadioButtonGroup(
          orientation: GroupedButtonsOrientation.horizontal,
          margin: const EdgeInsets.only(left: 12.0),
          onSelected: (String selected) => setState(() {
            _picked = selected;
          }),
          labels: const <String>[
            "Cranberry",
            "Date",
          ],
          picked: _picked,
          itemBuilder: (Radio rb, Text txt, int i) {
            return Column(
              children: <Widget>[
                const Icon(Icons.public),
                rb,
                txt,
              ],
            );
          },
          activeColor: Colors.red,
        ),
      ],
    );
  }
}
