import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class Mytranslatecontroller extends GetxController
{
 // get sharepref => null;

  //get intialLang => null;



  void changeLang(String codelang)
  {
   // Locale intialLang= sharepref!.getString("lang")=="ar" ? Locale("ar") : Locale("en");
      Locale  local = Locale(codelang) ;
    //  sharepref!.setString("lang",codelang);
    Get.updateLocale(local);
  }
}