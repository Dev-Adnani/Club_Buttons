/*
Name: Dev Adnani
Date: 21/05/2023
Purpose: define the CheckboxGroup object
Copyright: © 2023, Dev Adnani. All rights reserved.
*/

import 'package:flutter/material.dart';
import 'grouped_buttons_orientation.dart';

class CheckboxGroup extends StatefulWidget {
  final List<String> labels;
  final List<String>? checked;
  final List<String>? disabled;
  final void Function(bool isChecked, String label, int index)? onChange;
  final void Function(List<String> selected)? onSelected;
  final TextStyle labelStyle;
  final GroupedButtonsOrientation orientation;
  final Widget Function(Checkbox checkBox, Text label, int index)? itemBuilder;
  final Color activeColor;
  final Color checkColor;
  final bool tristate;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const CheckboxGroup({
    Key? key,
    required this.labels,
    this.checked,
    this.disabled,
    this.onChange,
    this.onSelected,
    this.labelStyle = const TextStyle(),
    required this.activeColor,
    this.checkColor = const Color(0xFFFFFFFF),
    this.tristate = false,
    this.orientation = GroupedButtonsOrientation.vertical,
    this.itemBuilder,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  State<CheckboxGroup> createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  List<String> _selected = [];

  @override
  void initState() {
    super.initState();
    _selected = widget.checked ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.checked != null) {
      _selected = [];
      _selected.addAll(widget.checked!);
    }

    List<Widget> content = [];

    for (int i = 0; i < widget.labels.length; i++) {
      Checkbox cb = Checkbox(
        value: _selected.contains(widget.labels.elementAt(i)),
        onChanged: (widget.disabled != null &&
                widget.disabled!.contains(widget.labels.elementAt(i)))
            ? null
            : (bool? isChecked) => onChanged(isChecked!, i),
        checkColor: widget.checkColor,
        activeColor: widget.activeColor,
        tristate: widget.tristate,
      );

      Text t = Text(
        widget.labels.elementAt(i),
        style: (widget.disabled != null &&
                widget.disabled!.contains(widget.labels.elementAt(i)))
            ? widget.labelStyle.apply(color: Theme.of(context).disabledColor)
            : widget.labelStyle,
      );

      if (widget.itemBuilder != null) {
        content.add(widget.itemBuilder!(cb, t, i));
      } else {
        if (widget.orientation == GroupedButtonsOrientation.vertical) {
          content.add(
            Row(
              children: <Widget>[
                const SizedBox(width: 12.0),
                cb,
                const SizedBox(width: 12.0),
                t,
              ],
            ),
          );
        } else {
          content.add(
            Column(
              children: <Widget>[
                cb,
                const SizedBox(width: 12.0),
                t,
              ],
            ),
          );
        }
      }
    }

    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: widget.orientation == GroupedButtonsOrientation.vertical
          ? Column(children: content)
          : Row(children: content),
    );
  }

  void onChanged(bool isChecked, int i) {
    bool isAlreadyContained = _selected.contains(widget.labels.elementAt(i));

    if (mounted) {
      setState(() {
        if (!isChecked && isAlreadyContained) {
          _selected.remove(widget.labels.elementAt(i));
        } else if (isChecked && !isAlreadyContained) {
          _selected.add(widget.labels.elementAt(i));
        }

        if (widget.onChange != null) {
          widget.onChange!(isChecked, widget.labels.elementAt(i), i);
        }
        if (widget.onSelected != null) widget.onSelected!(_selected);
      });
    }
  }
}
