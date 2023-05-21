# grouped_buttons
All Credit Goes Its Orignal Owner - Akshath Jain
A collection of Flutter widgets for grouping checkboxes and radio buttons easily!

## Installation

Add the following to your `pubspec.yaml` file:

dependencies:
grouped_buttons: ^0.0.1


## Simple Usage

Creating a basic `CheckboxGroup`:

```dart
CheckboxGroup(
  labels: <String>[
    "Apple",
    "Banana",
    "Cranberry",
    "Date",
    "Elderberry",
    "Fig",
    "Grape",
    "Honeydew"
  ],
  onSelected: (List<String> checked) => print(checked.toString())
);
```

Creating a basic RadioButtonGroup:
```dart
RadioButtonGroup(
  labels: <String>[
    "Apple",
    "Banana",
  ],
  onSelected: (String selected) => print(selected)
);
```

Custom CheckboxGroup:

|   Properties  |  Description |
|---------------|--------------|
|activeColor|The color to use when a Checkbox is checked.|
|checkColor|The color to use for the check icon when a Checkbox is checked.|
|checked|Specifies which boxes to be automatically checked. Every element must match a label. Use an empty list (`[]`) to clear all selections. If this is non-null, you must handle updating this list; otherwise, the CheckboxGroup won't change its state.|
|disabled|Specifies which boxes should be disabled. If this is non-null, no boxes will be disabled. The strings passed to this must match the labels.|
|itemBuilder|Called when needed to build a CheckboxGroup element.|
|labels|(required) A list of strings that describes each Checkbox. Each label must be distinct.|
|labelStyle|The style to use for the labels.|
|margin|Empty space surrounding the CheckboxGroup.|
|onChange|Called when the value of the CheckboxGroup changes.|
|onSelected|Called when the user makes a selection.|
|orientation|Specifies the orientation to display elements. Either `GroupedButtonsOrientation.horizontal` or `GroupedButtonsOrientation.vertical`.|
|padding|Empty space in which to inset the CheckboxGroup.|
|tristate|If true, the checkbox's value can be true, false, or null.|

```dart
List<String> _checked = ["A", "B"];

CheckboxGroup(
  orientation: GroupedButtonsOrientation.horizontal,
  margin: const EdgeInsets.only(left: 12.0),
  onSelected: (List selected) => setState(() {
    _checked = selected;
  }),
  labels: <String>[
    "A",
    "B",
  ],
  checked: _checked,
  itemBuilder: (Checkbox cb, Text txt, int i) {
    return Column(
      children: <Widget>[
        Icon(Icons.polymer),
        cb,
        txt,
      ],
    );
  },
);
```

Custom RadioButtonGroup:
|   Properties  |  Description |
|---------------|--------------|
|activeColor|The color to use when a Radio button is checked.|
|disabled|Specifies which buttons should be disabled. If this is non-null, no buttons will be disabled. The strings passed to this must match the labels.|
|itemBuilder|Called when needed to build a RadioButtonGroup element.|
|labels|(required) A list of strings that describes each Radio button. Each label must be distinct.|
|labelStyle|The style to use for the labels.|
|margin|Empty space surrounding the RadioButtonGroup.|
|onChange|Called when the value of the RadioButtonGroup changes.|
|onSelected|Called when the user makes a selection.|
|orientation|Specifies the orientation to display elements. Either GroupedButtonsOrientation.horizontal or GroupedButtonsOrientation.vertical.|
|padding|Empty space in which to inset the RadioButtonGroup.|
|picked|Specifies which Radio button to automatically pick. Every element must match a label. Use an empty string ("") to clear the selection. If this is non-null, you must handle updating this; otherwise, the RadioButtonGroup won't change its state.|

```dart
String _picked = "Two";

RadioButtonGroup(
  orientation: GroupedButtonsOrientation.horizontal,
  margin: const EdgeInsets.only(left: 12.0),
  onSelected: (String selected) => setState(() {
    _picked = selected;
  }),
  labels: <String>[
    "One",
    "Two",
  ],
  picked: _picked,
  itemBuilder: (Radio rb, Text txt, int i) {
    return Column(
      children: <Widget>[
        Icon(Icons.public),
        rb,
        txt,
      ],
    );
  },
);
```