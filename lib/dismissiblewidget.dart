import 'package:flutter/material.dart';

class DismissibleWidgettt extends StatefulWidget {
  const DismissibleWidgettt({Key? key}) : super(key: key);

  @override
  State<DismissibleWidgettt> createState() => _DismissibleWidgetttState();
}

class _DismissibleWidgetttState extends State<DismissibleWidgettt> {
  List mylst = <String>[];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissible Widget"),
      ),
      body: ListView.builder(
          itemCount: mylst.length,
          itemBuilder: (context, index) => Dismissible(
              background: Container(
                color: Colors.blue,
              ),
              secondaryBackground: Container(color: Colors.green),
              resizeDuration: const Duration(seconds: 2),
              onDismissed: (direction) {
                setState(() {
                  mylst.removeAt(index);
                });
              },
              key: ValueKey(mylst.elementAt(index)),
              child: ListTile(
                title: Text(mylst.elementAt(index)),
              ))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              mylst.add("Item Number $i");
              ++i;
            });
          }),
    );
  }
}
