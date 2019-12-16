import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/create_build_bloc.dart';

class CreateBuild_SelectClass extends StatelessWidget {


  List<Map<String, dynamic>> _classes = [
    {"number":0, "image":"images/class_selection_cra.png"},
    {"number":1, "image":"images/class_selection_eca.png"},
    {"number":2, "image":"images/class_selection_sac.png"},
    {"number":3, "image":"images/class_selection_zob.png"},
    {"number":4, "image":"images/class_selection_sram.png"},
    {"number":5, "image":"images/class_selection_oug.png"},
    {"number":6, "image":"images/class_selection_iop.png"},
    {"number":7, "image":"images/class_selection_eni.png"},
    {"number":8, "image":"images/class_selection_feca.png"},
    {"number":9, "image":"images/class_selection_sad.png"},
    {"number":10, "image":"images/class_selection_enu.png"},
    {"number":11, "image":"images/class_selection_elio.png"},
    {"number":12, "image":"images/class_selection_steam.png"},
    {"number":13, "image":"images/class_selection_hupp.png"},
    {"number":14, "image":"images/class_selection_xel.png"},
    {"number":15, "image":"images/class_selection_osa.png"},
    {"number":16, "image":"images/class_selection_pand.png"},
    {"number":17, "image":"images/class_selection_lad.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _classes.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    BlocProvider.of<CreateBuildBloc>(context).setHead(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(_classes[index]["image"])),
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
