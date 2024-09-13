import 'package:flutter/material.dart';

import 'models/sourceResponse.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TabItem({
    required this.source,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Color(0xff39A552),
        ),
        color: isSelected ? Color(0xff39A552) : Colors.transparent,
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xff39A552),
        ),
      ),
    );
  }
}
