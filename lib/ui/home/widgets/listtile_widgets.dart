// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';

Widget customTile({
required IconData icon,
required String title,
required VoidCallback onTap,
}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6.0),
    child:Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ]
      ),
      child: ListTile(
        leading: Icon(icon,color: AppColors.backgroundGrayCard,),
        title: Text(title,style: TextStyle(color: AppColors.backgroundGrayCard),),
        onTap: onTap,
      ),
      ),
    );
}