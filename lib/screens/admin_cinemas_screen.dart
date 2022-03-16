import 'package:cuevan_app/models/cines_model.dart';
import 'package:cuevan_app/utilities/get_cines.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminCinemasScreen extends StatefulWidget {
   
  const AdminCinemasScreen({Key? key}) : super(key: key);

  @override
  State<AdminCinemasScreen> createState() => _AdminCinemasScreenState();
}

class _AdminCinemasScreenState extends State<AdminCinemasScreen> {

  List<Cine> listOfCines = [];
  bool isLoading = true;

  @override
  void initState() {
    getCinesDB();
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
                        Icons.menu_rounded,
                        size: 40,
                      ),
                    ],
                  ),
                ),
                Lottie.asset('assets/animations/admin_home.json',
                    height: 250, width: double.infinity),
                const Center(
                  child: Text(
                    'Dog',
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
                    child:isLoading ? null: _listCinemasView(),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Widget _listCinemasView() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: listOfCines.length,
      itemBuilder: (BuildContext context, int index) {
        return _listCineViewItem(index);
      },
    );
  }

  Widget _listCineViewItem(int index) {
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
                  listOfCines[index].nombre,
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
                GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () => {}),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onTap: () => {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getCinesDB() async {
    print('hola');
    final response = await GetCines.getCines();
    listOfCines = response.cines;
    isLoading = false;
    setState(() {});
  }
}