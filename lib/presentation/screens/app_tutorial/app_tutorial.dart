import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
    final String title;
    final String caption;
    final String imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
    SlideInfo(title: "Buscar la comida", caption: "Comida", imageUrl: "assets/images/1.png"),
    SlideInfo(title: "Entrega rapida", caption: "Entrega", imageUrl: "assets/images/2.png"),
    SlideInfo(title: "Disfruta la comida", caption: "Exito!", imageUrl: "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";
  
  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageviewController = PageController();

  // Bandera para saber posición final de pagecontroller
  bool endRearched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageviewController.addListener(() { 
        final page = pageviewController.page??0;

        if(!endRearched && page>= (slides.length-1.5)){
            setState(() {
                endRearched=true;
            });
        }
        print('PAGINA ${pageviewController.page}');
    });
  } 

  // Destruir controllers
  @override
  void dispose() {
    pageviewController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: [
                  // Pageview para mostrar páginas
                  PageView(
                      controller: pageviewController,
                      physics: const BouncingScrollPhysics(),
                      children: slides.map(
                          (e) => _Slide(title: e.title, caption: e.caption, imageUrl: e.imageUrl)
                      ).toList(),
                  ),
                  Positioned(
                      right: 20,
                      top: 50,
                      child: TextButton(
                          onPressed: () {
                              context.pop();
                          }, 
                          child: const Text("Salir")
                      )
                  ),
                  // Si es el final muestro
                  endRearched?
                      Positioned(
                        bottom: 30,
                        right: 30,
                        child:  FadeInRight(
                          from: 15,
                          delay: const Duration(seconds: 1),
                          child: FilledButton(
                              onPressed: () {
                                  context.pop();
                              }, 
                              child: const Text("Empezar tutorial")),
                        ),
                      ):
                      const SizedBox(),
            ],
        ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({Key? key, required this.title, required this.caption, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;
    
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Image(image: AssetImage(imageUrl)),
                    const SizedBox(height: 10,),
                    Text(title, style: titleStyle,),
                    const SizedBox(height: 10,),
                    Text(caption, style: captionStyle,)
                ],
            ),
        ),
    );
  }
}