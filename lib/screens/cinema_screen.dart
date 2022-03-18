import 'package:cuevan_app/models/cines_model.dart';
import 'package:cuevan_app/models/list_cines_model.dart';
import 'package:cuevan_app/models/pelicula_model.dart';
import 'package:cuevan_app/utilities/get_cines.dart';
import 'package:cuevan_app/utilities/get_peliculas.dart';
import 'package:flutter/material.dart';

class CinemaScreen extends StatefulWidget {
  const CinemaScreen({Key? key}) : super(key: key);

  @override
  State<CinemaScreen> createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  List<Cine> listOfCines = [];
  bool isLoading = true;
  List<Pelicula> listOfPeliculas = [];
  bool isLoadingPe = true;

  @override
  void initState() {
    getCinesDB();
    getPeliculasDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 9),
              child: Row(
                children: const [
                  Text(
                    'Nuestro TOP de peliculas',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 310, child: isLoadingPe ? CircularProgressIndicator() : _listTopFilms()),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 9),
                  child: Row(
                    children: const [
                      Text(
                        'Nuestros Cines',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Flexible(child: isLoading ? const CircularProgressIndicator() : _listOfCinemas()),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Peliculas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: "Usuario",
          ),
        ],
      ),
    );
  }

  Widget _listTopFilms() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listOfPeliculas.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _cardTopFilms(index);
        });
  }

  Widget _cardTopFilms(int index) {
    return Card(
      margin: const EdgeInsets.only(top: 50, left: 15, right: 15),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage(listOfPeliculas[index].imageUrl)),
                  ),
                ),
              ),
              Text(
                listOfPeliculas[index].nombre,
                textAlign: TextAlign.start,
              ),
              const Text('2016'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listOfCinemas() {
    return ListView.builder(
      itemCount: listOfCines.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                          Image.network(listOfCines[index].imageUrl, fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listOfCines[index].nombre,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        listOfCines[index].direccion,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        listOfCines[index].telefono,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void getCinesDB() async {
    final response = await GetCines.getCines();
    listOfCines = response.cines;
    isLoading = false;
    setState(() {});
  }

  void getPeliculasDB() async {
    final response = await GetPeliculas.getPeliculas();
    listOfPeliculas = response.peliculas;
    isLoadingPe = false;
    setState(() {});
  }
}
