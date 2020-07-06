import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Context {
  double price;
  String image;
  Context({this.price, this.image});
}

List<Context> destacados = [
Context(price: 0.99, image: "assets/1.jpg"),
Context(price: 9.50, image: "assets/2.jpg"),
Context(price: 2.02, image: "assets/3.jpg"),
Context(price: 1.68, image: ""),
Context(price: 3.58, image: ""),
Context(price: 1.47, image: ""),
Context(price: 1.56, image: ""),
Context(price: 2.19, image: ""),
Context(price: 3.74, image: ""),
Context(price: 4.50, image: ""),
];




class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        color: Colors.grey[300],
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              swiper(),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 4),
                child: Text(
                  "Categorías",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              _categorias(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" Destacados",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                  ),
                  Text("Ver todo ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                ],
              ),
            ),
            _destacados(destacados),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _bottomAction(Icons.store),
            _bottomAction(Icons.fastfood),
            _bottomAction(Icons.access_time),
            _bottomAction(Icons.person),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        "super easy",
        style: TextStyle(fontSize: 25),
      ),
      leading: Icon(Icons.menu),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 12),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.green[700]),
            padding: EdgeInsets.only(left: 17),
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ubicacion",
                  style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  padding: EdgeInsets.only(left: 9),
                  height: 35,
                  width: MediaQuery.of(context).size.width / 1.22,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 28,
                      ),
                      Text(
                        " ¿Qué estás buscando?",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: 33,
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(30)),
    );
  }

  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
        child: Icon(
          icon,
          size: 33,
          color: Colors.white,
        ),
      ),
      onTap: () {},
    );
  }

  Widget swiper() {
    return Container(
      height: 130,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Image.network(
              "http://via.placeholder.com/450x150",
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: 4,
        pagination: SwiperPagination(alignment: Alignment(0, 1.55)),
      ),
    );
  }

  Widget _categorias() {
    return Container(
      height: MediaQuery.of(context).size.width / 1.28,
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 2.1,
        children: List.generate(15, (index) {
          return Padding(
            padding: const EdgeInsets.all(1.5),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    color: Colors.green,
                  ),
                  Text("  $index")
                ],
              ),
              color: Colors.white,
            ),
          );
        }),
      ),
    );
  }

Widget _destacados(List<Context> list) {
  return Container(
    padding: EdgeInsets.all(2),
    height: MediaQuery.of(context).size.height / 3.05,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, index) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width / 3.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(list[index].image),
                fit: BoxFit.cover,
                height: 115,
                ),
                Text("\$ ${list[index].price}",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.5,
                  fontWeight: FontWeight.w500,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Nombre Producto",
                  style: TextStyle(
                    fontSize: 14.2,
                    color: Colors.grey
                  ),
                  ),
                ),
                Container(
                  height: 25,
                  child: OutlineButton.icon(
                    onPressed: (){}, 
                    icon: Icon(Icons.add_shopping_cart,
                    size: 15,
                    ), 
                    label: Text("Agregar",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    ),
                    textColor: Colors.green,
                    borderSide: BorderSide(
                      color: Colors.green, width: 1.5
                    ),
                    ),
                    
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
          
        );
      }),
  );
}


}
