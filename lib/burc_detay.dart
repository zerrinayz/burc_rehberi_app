import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenburc;
  const BurcDetay({super.key, required this.secilenburc});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {

  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;
  

  @override
  void initState() {
    super.initState();
    appbarRenginiBul();
    WidgetsBinding.instance.addPostFrameCallback((_) => appbarRenginiBul()); //Önce buil yapılır,sonra işelmler yapılır. Setstate ile buil tekrar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title:  Text(widget.secilenburc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
              // ignore: prefer_interpolation_to_compose_strings
              background: Image.asset('images/' + widget.secilenburc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(widget.secilenburc.burcDetayi, style: Theme.of(context).textTheme.titleMedium,
                ),
                ),
            ),
          ),
        ],
      ) 
    );
  }
  
  void appbarRenginiBul() async{
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage('images/${widget.secilenburc.burcBuyukResim}'));
      appbarRengi= _generator.dominantColor!.color;
      setState(() {
        
      });
  }
}