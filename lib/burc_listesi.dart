
import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_item.dart';
import 'package:flutter_burclar/data/strings.dart';
import 'package:flutter_burclar/model/burc.dart';

// ignore: must_be_immutable
class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;

  BurcListesi({super.key}){
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Burclar Listesi'),
      ),
      body:  Center(
        child: ListView.builder(itemBuilder: (context , index){
          return BurcItem(listelenenBurc: tumBurclar[index],);
        },
         itemCount: tumBurclar.length,),
      ),
    );
  }
  
  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];

    for (int i=0; i< 12; i++){
      var burcAdi =Strings.BURC_ADLARI[i];
      var burcTarih =Strings.BURC_TARIHLERI[i];
      var burcDetay =Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim = '${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png';
      var burcBuyukResim = '${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png';

      Burc eklenecekBurc = Burc(burcAdi,burcTarih,burcDetay,burcKucukResim,burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}