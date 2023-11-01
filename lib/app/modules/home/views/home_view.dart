import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text('Name Validator (Logic Test)',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(builder: (_) {
          return Form(
            key: _.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _.validasiController,
                    decoration: const InputDecoration(
                        hintText: 'Masukan nama', border: OutlineInputBorder()),
                    // obsecureText: _.isHide.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Text(_.printName.value),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      _.validateAndSave(_.validasiController.text);
                    },
                    child: const Text("Cek validasi nama"))
              ],
            ),
          );
        }));
  }
}
