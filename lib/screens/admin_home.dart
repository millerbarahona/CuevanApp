import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _menuItem({required String text,required IconData icono,required String routeName}) {
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: const Color(0xffF0F0F0),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      icono,
                      size: 35,
                      color: const Color(0xff2a292f),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        text,
                        style: TextStyle(),
                      )),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      );
    }

    Widget _menuList() {
    return Container(
      padding: const EdgeInsets.only(top: 1),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _menuItem(text: 'Users', icono: Icons.account_circle, routeName: 'admin_users'),
          _menuItem(text: 'Tickets', icono: Icons.confirmation_num_outlined, routeName: 'admin_users'),
          _menuItem(text: 'Cinemas', icono: Icons.store_mall_directory_rounded, routeName: 'admin_cinemas'),
          _menuItem(text: 'Films', icono: Icons.video_camera_back_rounded, routeName: 'admin_users'),
          _menuItem(text: 'Rooms', icono: Icons.airline_seat_recline_normal_rounded, routeName: 'admin_users'),
        ],
      ),
    );
  }

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
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: _menuList(),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
