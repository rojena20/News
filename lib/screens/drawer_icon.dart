import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  Function onIconPresses;
  static const int categoryID = 1;
  static const int settingsID = 2;

  DrawerIcon({
    super.key,
    required this.onIconPresses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            decoration: BoxDecoration(
              color: Color(0xff39A552),
            ),
            child: Center(
              child: Text(
                "News App!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    onIconPresses(categoryID);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.view_list_rounded,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    onIconPresses(settingsID);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
