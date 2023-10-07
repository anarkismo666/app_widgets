import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = "infine_screen";
  
  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesID =[1,2,3,4,5];

  final ScrollController scrollController = ScrollController();

  // Para saber si está cargando imagenes
  bool isLoading = false;
  // Para saber si componente de imagenes existe
  bool isMounted= true;

  @override
  void initState() {
    scrollController.addListener(() { 
        if((scrollController.position.pixels +500) >= scrollController.position.maxScrollExtent){
            // Carga siguiente página
            loadNextPage();
        }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Avisamos de la destrucción de componente
    isMounted = false;
    scrollController.dispose();
    // TODO: implement 
    // dispose
    super.dispose();
  }

  // metodo para añadir imagenes
  void addFiveImage(){
      final lastId = imagesID.last;
        // Revisar si esta montado el componente
        if(!isMounted) return;

        setState(() {
            imagesID.addAll(
                [1,2,3,4,5].map((e) => lastId + e)
            );
        });
  }

  // Metodo para mover un poco el scroll
  void moveScrollToBottom(){

      if((scrollController.position.pixels + 150)<=scrollController.position.maxScrollExtent) return;
      
      scrollController.animateTo(
        scrollController.position.pixels + 120, 
        duration: const Duration(milliseconds: 300), 
        curve: Curves.fastOutSlowIn
      );
  }

  Future loadNextPage() async{
        if(isLoading) return;

        isLoading = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 2));
        addFiveImage();

        isLoading= false;
        // Revisar si esta montado el componente
        if(!isMounted) return;
        setState(() {});

        // Movemos un poco el scroll
        moveScrollToBottom();
  }
 
  Future<void> onRefresh() async{
      isLoading=true;
      setState(() {});

      await Future.delayed(const Duration(seconds: 2));

      if(!isMounted) return;
      isLoading=false;
      final lastId = imagesID.last;
    
      imagesID.clear();

      imagesID.add(lastId+1);
      addFiveImage();
      
      setState(() {});
      
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Removemos paddin 
        backgroundColor: Colors.black,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          // Envolvemps en refresh indicatos para mostrar un refresh
          child: RefreshIndicator(
            onRefresh: () => onRefresh(),
            edgeOffset: 10,
            child: ListView.builder(
                controller: scrollController,
                itemCount: imagesID.length,
                itemBuilder: (context, index) {
                    return FadeInImage(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                      placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                      image: NetworkImage('https://picsum.photos/id/${imagesID[index]}/200/300')
                    );
                },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: isLoading? SpinPerfect
              ( 
                  infinite: true,
                  child: const Icon(Icons.refresh_rounded) 
              )
              :
              const Icon(Icons.arrow_back) ,
        ),
    );
  }
}