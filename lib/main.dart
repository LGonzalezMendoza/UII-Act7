import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guitar Music Shop 0490',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://raw.githubusercontent.com/LGonzalezMendoza/img_FluterFlow_ios_6j/main/Flutter%20GonzalezM/Imagenes/Apx600.jpg",
    "https://raw.githubusercontent.com/LGonzalezMendoza/img_FluterFlow_ios_6j/main/Flutter%20GonzalezM/Imagenes/De%20rosa.jpg",
    "https://raw.githubusercontent.com/LGonzalezMendoza/img_FluterFlow_ios_6j/main/Flutter%20GonzalezM/Imagenes/Fender.jpg",
    "https://raw.githubusercontent.com/LGonzalezMendoza/img_FluterFlow_ios_6j/main/Flutter%20GonzalezM/Imagenes/Taylor-114.jpg",
    "https://raw.githubusercontent.com/LGonzalezMendoza/img_FluterFlow_ios_6j/main/Flutter%20GonzalezM/Imagenes/Tekamine.jpg",
    "https://raw.githubusercontent.com/LGonzalezMendoza/img_FluterFlow_ios_6j/main/Flutter%20GonzalezM/Imagenes/gibson%20class.jpg"
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2eedd),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Guitar Music Shop 0490",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Image.network(e),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouselIndicator(),
            const Text(
              "Prueba nuestra variedad de Guitarras",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 0; i < imgList.length; i++)
        Container(
          margin: const EdgeInsets.all(5),
          height: i == _currentPage ? 7 : 5,
          width: i == _currentPage ? 7 : 5,
          decoration: BoxDecoration(
              color: i == _currentPage
                  ? const Color(0xffffffff)
                  : const Color(0xff848484),
              shape: BoxShape.circle),
        )
    ]);
  }
}

/*import 'package:flutter/material.dart';
import 'package:gonzalez0490/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guitar music shop 0490',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}

*/
