import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController validasiController;
  late GlobalKey<FormState> formKey;
  RxString printName = ''.obs;

  List<int> dataLogic = [];
  @override
  void onInit() {
    validasiController = TextEditingController();
    formKey = GlobalKey<FormState>();
    update();
    super.onInit();
  }

  void validateAndSave(String validName) {
    update();
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      List<String> terms = validName.split(' ');
      for (String term in terms) {
        update();

        var splitag = validName.split(" ");

        if (terms.length > 2) {
          if (splitag[0].length == 2 &&
              splitag[1].length > 2 &&
              splitag[2].length >= 2) {
            dataLogic.add(0);
          }
        }
        if (terms.length == 1) {
          update();
          print("$term = Salah");
          dataLogic.add(0);
        } else if (splitag[0].length == 2 &&
            splitag[1].length == 2 &&
            splitag[2].length == 2) {
          dataLogic.add(0);
        } else if (splitag[0].length == 2 &&
            splitag[1].length >= 2 &&
            term == splitag[0].capitalizeFirst) {
          update();

          dataLogic.add(1);
        } else {
          update();
          if (term.length == 1) {
            update();

            dataLogic.add(0);
          } else if (term.length == 2) {
            update();
            if (term == term.toUpperCase()) {
              update();
              if (term.contains(".")) {
                update();

                dataLogic.add(1);
              } else {
                update();

                dataLogic.add(0);
              }
            } else {
              update();

              dataLogic.add(0);
            }
          } else if (term != "") {
            if (term == term.capitalizeFirst && !term.contains(".")) {
              dataLogic.add(1);
            } else {
              dataLogic.add(0);
            }
          }
        }
      }

      if (dataLogic.contains(0)) {
        printName.value = 'false';
        dataLogic = [];
      } else {
        printName.value = 'true';
        dataLogic = [];
      }

      update();
    } else {
      update();
    }
  }

  @override
  void onReady() {
    update();
    super.onReady();
  }
}
