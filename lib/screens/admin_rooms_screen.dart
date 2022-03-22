import 'package:cuevan_app/models/cines_model.dart';
import 'package:cuevan_app/models/sala_cines_model.dart';
import 'package:cuevan_app/models/salas_model.dart';
import 'package:cuevan_app/models/user_model.dart';
import 'package:cuevan_app/utilities/delete_cines.dart';
import 'package:cuevan_app/utilities/delete_salas.dart';
import 'package:cuevan_app/utilities/get_cines.dart';
import 'package:cuevan_app/utilities/get_rooms_cines.dart';
import 'package:cuevan_app/utilities/put_sala.dart';
import 'package:cuevan_app/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminRoomsScreen extends StatefulWidget {
  const AdminRoomsScreen({Key? key}) : super(key: key);

  @override
  State<AdminRoomsScreen> createState() => _AdminRoomsScreenState();
}

class _AdminRoomsScreenState extends State<AdminRoomsScreen> {
  List<SalaCine> listOfSalas = [];
  bool isLoading = true;
  Map<String, dynamic> formValues = {
    'numero': 0,
  };
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getSalasDB();
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
                                  'Rooms',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'add_cinema'),
                        child: const Icon(
                          Icons.add_circle_rounded,
                          size: 40,
                        ),
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
                    child: isLoading ? null : _listCinemasView(),
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
      itemCount: listOfSalas.length,
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
                  '${listOfSalas[index].nombre}, Sala ${listOfSalas[index].numeroSala}',
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
                GestureDetector(child: const Icon(Icons.edit), onTap: () => _showEditUserDialog(listOfSalas[index])
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onTap: () async {
                    deleteSalas(listOfSalas[index].id);
                    //getCinesDB();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _showEditUserDialog(SalaCine sala) {
    return showDialog<String>(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Edit a user data'),
              content: _contentEditAlert(sala),
              actions: [
                ElevatedButton(
                    child: const Text(
                      'Save Changes',
                    ),
                    onPressed: () async{
                      formKey.currentState?.save();
                      print(formValues['numero']);
                      await PutSalas.putSalas(sala.id, formValues['numero'], sala.id_cine);
                      Navigator.pop(context);
                      getSalasDB();
                    })
              ],
            ));
  }

  Widget _contentEditAlert(SalaCine sala) {
    
    formValues['numero'] = sala.numeroSala;
    return Container(
        height: 300,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputField(
                hintText: 'Numero',
                obscureText: false,
                initialValue: sala.numeroSala,
                labelText: 'Numero',
                onSaved: (String? value) {
                  formValues['numero'] = value;
                },
              ),              
            ],
          ),
        ));
  }

  void getSalasDB() async {
    final response = await GetRoomsCines.getRooms();
    listOfSalas = response.salas;
    isLoading = false;
    setState(() {});
  }

  void deleteSalas(int id) async {
    final response = await DeleteSalas.deleteSalas(id);
    getSalasDB();
  }
}
