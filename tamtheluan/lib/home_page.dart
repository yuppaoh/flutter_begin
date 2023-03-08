import 'dart:convert';
import 'package:flutter/material.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/namsinh.json');
    final data = await json.decode(response);
    setState(() {
      items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              readJson();
            },
            child: const Text('Read data'),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (BuildContext context, int index) {
                  var nam = items[index]['nam'];
                  var canChi = items[index]['can-chi'];

                  return Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.account_box),
                        ),
                        title: Text(nam),
                        subtitle: Text(canChi),
                      ),
                      const Divider(),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
