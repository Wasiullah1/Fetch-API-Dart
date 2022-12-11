import 'dart:convert';

import 'package:api/Model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersModel extends StatefulWidget {
  const UsersModel({super.key});

  @override
  State<UsersModel> createState() => _UsersModelState();
}

class _UsersModelState extends State<UsersModel> {
  List<UserModel> userList = [];

  Future<List<UserModel>> UserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Api"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: UserApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  ReusableRow(
                                      title: 'Name: ',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  ReusableRow(
                                      title: 'Username: ',
                                      value: snapshot.data![index].username
                                          .toString()),
                                  ReusableRow(
                                      title: 'Email: ',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  ReusableRow(
                                      title: 'Adress: ',
                                      value: snapshot.data![index].address!.city
                                          .toString()),
                                ]));
                          });
                    }
                  }))
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
