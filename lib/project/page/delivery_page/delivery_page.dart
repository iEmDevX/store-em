import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryPage extends StatefulWidget {
  DeliveryPage({Key key}) : super(key: key);
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.green[200],
            child: Consumer<MyModel>(builder: (context, myModel, child) {
              return MyButton();
            }),
          ),
          Container(
            padding: const EdgeInsets.all(35),
            color: Colors.blue[200],
            child: Consumer<MyModel>(builder: (context, myModel, child) {
              return Text(myModel.someValue);
            }),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context, listen: false);
    return RaisedButton(
      child: Text('Do something'),
      onPressed: () {
        myModel.doSomething();
      },
    );
  }
}

class MyModel with ChangeNotifier {
  //                                               <--- MyModel
  String someValue = 'Hello';
  void doSomething() {
    if (someValue == 'Hello') {
      someValue = 'Goodbye';
    } else {
      someValue = 'Hello';
    }
    print(someValue);
    notifyListeners();
  }
}
