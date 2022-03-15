import 'package:flutter/material.dart';

class CinemaScreen extends StatelessWidget {
  const CinemaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            SizedBox(
              height: 310,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Card(
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
                                child: Image.network(
                                    'https://static.wikia.nocookie.net/disney/images/b/b7/Big-Hero-6-Poster.png/revision/latest/scale-to-width-down/350?cb=20150227215228&path-prefix=es'),
                              ),
                            ),
                          ),
                          const Text(
                            'Superhero',
                            textAlign: TextAlign.start,
                          ),
                          const Text('2016'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  child: Flexible(
                    child: ListView.builder(
                      itemCount: 15,
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
                                      child: Image.network(
                                          'https://i.ibb.co/TqcXzdx/image4.jpg'),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Centro comercial X',
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        'Carrera 58 no. 44 - 76',
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        '9068317',
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
                    ),
                  ),
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
}
