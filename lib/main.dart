import 'package:flutter/material.dart';
import 'package:prodcat/models/product.model.dart';
import 'package:prodcat/repositories/product.repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductModel> _products = new List<ProductModel>();
  ProductRepository _repository = new ProductRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new FutureBuilder(
        future: _repository.getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Text('Carregando...');
            default:
              if (snapshot.hasError)
                return new Text(snapshot.error);
              else
                return listView(context, snapshot);
          }
        },
      ),
    );
  }

  Widget listView(BuildContext context, AsyncSnapshot snapshot) {
    List<ProductModel> products = snapshot.data;

    return new ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(products[index].title),
            ),
          ],
        );
      },
    );
  }
}
