import 'package:cuevan_app/models/cines_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminAddCinemasScreen extends StatefulWidget {
  const AdminAddCinemasScreen({Key? key}) : super(key: key);

  @override
  State<AdminAddCinemasScreen> createState() => _AdminAddCinemasScreenState();
}

class _AdminAddCinemasScreenState extends State<AdminAddCinemasScreen> {
  List<Cine> listOfCines = [];
  bool isLoading = true;

  @override
  void initState() {    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(color: Color(0xffF0F0F0)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        child: const Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Icon(
                        Icons.add_circle_rounded,
                        size: 40,
                      ),
                    ],
                  ),
                ),
                Lottie.asset('assets/animations/admin_home.json',
                    height: 250, width: double.infinity),
                const Center(
                  child: Text(
                    'Cinema',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: const Text('formulario'),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}