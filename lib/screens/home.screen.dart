import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Icon(Icons.shopping_bag),
                SizedBox(width: 10),
                Stack(
                  children: [
                    Icon(Icons.notifications),
                    Padding(
                      padding: EdgeInsets.only(left: 13, top: 5),
                      child: ClipOval(
                        child: Container(
                          width: 7,
                          height: 7,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              'Find modern\nfurniture for you',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                (index) => Label(
                  label: categories[index],
                  active: currentCategoryIndex == index,
                  onTap: () {
                    currentCategoryIndex = index;
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String label;
  final bool active;
  final Function onTap;
  Label({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.hardEdge,
        color: active ? Colors.black : Colors.grey.shade50,
        child: InkWell(
          child: Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(color: active ? Colors.transparent : Colors.grey),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(color: active ? Colors.white : Colors.grey),
              ),
            ),
          ),
          onTap: () {
            onTap();
          },
        ),
      ),
    );
  }
}

List<String> categories = [
  'Chair',
  'Sofa',
  'Table',
  'Lamp',
  'Kitchen',
  'Office'
];
