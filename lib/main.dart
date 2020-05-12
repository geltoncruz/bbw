import 'package:flutter/material.dart';
import 'package:myapp/models/item.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marias App',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(title: "Chica da Silva", done: true));
    items.add(Item(title: "Maria da Penha", done: false));
    items.add(Item(title: "Luísa Mahin", done: true));
    items.add(Item(title: "Teresa de Benguela", done: true));
    items.add(Item(title: "Maria Filipa de Oliveira", done: true));
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = new TextEditingController();

  void add() {
    if (nameController.text.isEmpty) return;
    setState(() {
      widget.items.add(
        Item(title: nameController.text, done: false),
      );
      nameController.clear();
    });
  }

  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: nameController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Add nova Maria",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctx, int index) {
          final item = widget.items[index];
          return Dismissible(
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                });
              },
            ),
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.2),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                remove(index);
              } else {
                return;
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
