import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_detay.dart';
import 'package:flutter_burclar/model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({super.key, required this.listelenenBurc});

  @override
  Widget build(BuildContext context) {
  var myTetxStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/burcDetay',
                arguments: listelenenBurc);
            },
            // ignore: prefer_interpolation_to_compose_strings
            leading:Image.asset("images/" +listelenenBurc.burcKucukResim,
            ),
            title: Text(listelenenBurc.burcAdi,
            style: myTetxStyle.headlineSmall,
            ),
            subtitle: Text(listelenenBurc.burcTarihi,
            style: myTetxStyle.titleMedium,
            ),
            trailing:  const Icon(
              Icons.arrow_forward_ios,
              color : Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}