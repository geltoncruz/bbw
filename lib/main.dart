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
    items.add(Item(title: "Aqualtune", done: false));
    items.add(Item(title: "Dandara", done: false));
    items.add(Item(title: "Carolina de Jesus", done: false));
    items.add(Item(title: "Leila Gonzalez ", done: false));
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = new TextEditingController();

  void add() {
    setState(() {
      widget.items.add(
        Item(title: nameController.text, done: false),
      );
      nameController.clear();
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
          return CheckboxListTile(
            title: Text(item.title),
            value: item.done,
            key: Key(item.title),
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
              print(value);
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
