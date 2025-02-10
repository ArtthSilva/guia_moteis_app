import 'package:flutter/material.dart';
import 'package:guia_moteis_app/domain/entities/motel_entity.dart';
import 'package:guia_moteis_app/ui/themes/theme_app.dart';
import 'package:guia_moteis_app/ui/widgets/suite_description.dart';

class CardMotel extends StatelessWidget {
  final MotelEntity motelOption;
  const CardMotel( {super.key, required this.motelOption});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(motelOption.logo),
              radius: 30,  
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(motelOption.name),
                Text(motelOption.neighborhood),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: ThemeApp.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFFf7b209),
                            width: 1,
                          )),
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Color(0xFFf7b209)),
                          Text(
                            motelOption.rating.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: ThemeApp.textColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child:Row(
                      children: [
                         Text('${motelOption.reviewCount.toString()} avaliações',
                              style: TextStyle(color: ThemeApp.textColor, fontSize: 12)),
                        
                        Icon(Icons.keyboard_arrow_down_outlined,
                            color: Colors.grey),
                      ],
                    ),
                )],
                
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(Icons.favorite, size: 26, color: Colors.grey,),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
           child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: motelOption.suites.length,
            itemBuilder: (context, index) {
              final suite = motelOption.suites[index];
              return  SingleChildScrollView(
                child: SuiteDescription(suiteInfo: suite),
              );
            },
          ),
        ),
      ],
    ),
  );
  }
}