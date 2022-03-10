import 'dart:convert';

import 'package:cuevan_app/models/list_users_model.dart';
import 'package:cuevan_app/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({Key? key}) : super(key: key);

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  List<User> listOfUsers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUsersFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(color: Color(0xffF0F0F0)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Color(0xffffffff)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 40,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                'Users',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                    GestureDetector(
                      child: const Icon(
                        Icons.add_circle_rounded,
                        size: 40,
                      ),
                      onTap: () => showDialog<String>(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Add a new admin'),
                              )),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Lottie.asset('assets/animations/users_admin.json',
                    height: 200),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: isLoading ? _isLoadign() : _listUsersView()),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _isLoadign() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
        SizedBox(
          height: 20,
        ),
        Text('Cargando...')
      ],
    );
  }

  Widget _listUsersView() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: listOfUsers.length,
      itemBuilder: (BuildContext context, int index) {
        return _listUserViewItem(index);
      },
    );
  }

  Widget _listUserViewItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle_rounded,
              ),
              Container(
                child: Text(
                  listOfUsers[index].nombre,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: const EdgeInsets.only(left: 10),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffF0F0F0)),
            child: Row(
              children: [
                const Icon(Icons.edit),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onTap: () => _showDeleteDiaglog(listOfUsers[index]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _showDeleteDiaglog(User user) {
    showDialog<String>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Delete ${user.nombre}'),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffF0F0F0),
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: const Text('Estas seguro de que quieres eliminar a este usuario?', textAlign: TextAlign.justify,),
          ),
          actions: [
            TextButton(child: const Text('Aceptar', style: TextStyle(color: Color(0xffA2A2A2) ),),
            onPressed: () => _postDeleteUserFromDB(user)),
            TextButton(child: const Text('Cancelar'),
            onPressed: () => {
              Navigator.pop(context)
            }),
          ],
        ));
  }

  _getUsersFromDB() async {
    const String baseUrl = '192.168.0.8:4000/';
    final dio = Dio();
    //final url = Uri.http( baseUrl, 'getusers', {});

    final response = await dio.get('http://192.168.0.8:4000/getusers');
    final responseJson = json.encode(response.data);
    final listUsers = ListUsers.fromJson(responseJson);

    listOfUsers = listUsers.users;
    isLoading = false;
    setState(() {});
  }

  _postDeleteUserFromDB( User user ) async {
    final dio = Dio();

    final response = await dio.delete(
      'http://192.168.0.8:4000/deleteuser',
      data: {"id": user.id},      
    );
    final responseJson = json.encode(response.data);
    final listUsers = ListUsers.fromJson(responseJson);

    listOfUsers = listUsers.users;
    isLoading = false;
    setState(() {});
    Navigator.pop(context);
  }
}
