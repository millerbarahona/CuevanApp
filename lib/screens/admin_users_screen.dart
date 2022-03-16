import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                      child: const Icon(Icons.add_circle_rounded, size: 40,),
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Add a new admin'),
                        )
                      ),
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
                  child: Text('listado de usurios'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
