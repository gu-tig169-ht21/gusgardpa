import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIG169 TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TIG169 TODO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.title), actions: [
        IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            })
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(height: 20),
            _checkbox('Write a book'),
            _divide(),
            _checkbox('Do homework'),
            _divide(),
            _checkedcheckbox('Tidy room'),
            _divide(),
            _checkbox('Watch TV'),
            _divide(),
            _checkbox('Nap'),
            _divide(),
            _checkbox('Shop groceries'),
            _divide(),
            _checkbox('Have fun'),
            _divide(),
            _checkbox('Meditate'),
            _divide(),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }

  Widget _checkbox(String text) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Text(text, style: const TextStyle(fontSize: 21)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
      ],
    );
  }

  Widget _checkedcheckbox(String text) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (val) {},
        ),
        Text(text,
            style: const TextStyle(
                decoration: TextDecoration.lineThrough, fontSize: 21)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
      ],
    );
  }

  Widget _divide() {
    return const Divider(
      height: 15,
      thickness: 1,
    );
  }
}

/* **************************  SECOND VIEW ********************* */

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TIG169 TODO'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 20.0,
              ),
              _inputBox(),
              _button(),
            ],
          ),
        ));
  }

  Widget _inputBox() {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(20),
        child: const TextField(
            decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0)),
          labelText: 'What are you going to do?',
        )));
  }

  Widget _button() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        onPressed: () {},
        child: const Text(
          '+ ADD',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
