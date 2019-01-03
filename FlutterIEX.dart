import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new UserOptions(),
    );
  }
}

class UserOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserOptionsState();
  }
}

class UserOptionsState extends State<UserOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text(
          'Profile',
          style: const TextStyle(fontSize: 19.0),
        ),
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return body(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget body(Map data) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              maxRadius: 40.0,
            ),
          ),
          Divider(),
          Text('Profile Details'),
          Container(
            // height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Table(
                border: TableBorder.all(width: 1.0, color: Colors.black),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Text('Company Symbol'),
                          new Text(data['symbol'].toString()),
                        ],
                      ),
                    )
  }
  _loadData() async {
    final response = await http.get("https://api.iextrading.com/1.0/stock/market/batch?symbols=aapl,fb&types=quote,news,chart&range=1m&last=5");
    final Map<String,dynamic> data = json.decode(response.body);
    List dataList = List();
    data.keys.forEach((key){
      dataList.add(data[key]["quote"]);
    });

    dataList.forEach((data){
      final symbol = data["symbol"];
      final companyName = data["companyName"];
      print("symbol :$symbol , companyName : $companyName");
    });


 return dataList;
  }

}
