// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projectadvance/service/service.dart';
import 'package:projectadvance/service/uploadimage.dart';
import 'package:projectadvance/view/welcome_page.dart';
import '../components/textbox.dart';
import '../components/newappbar.dart';
import '../utils/listtitle.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int? _selectedIndex;
  String image = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController merkController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController datePick = TextEditingController();
  Future<void> addItem() async {
    await Service.createItems(nameController.text, noHpController.text,
        merkController.text, modelController.text, image, datePick.text);
  }

  getImage() async {
    var data = await pickImage();
    if (data != null) {
      image = await pickImage();
      setState(() {});
    }
  }

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked

        datePick.text = DateFormat("yyyy-MM-dd").format(pickedDate).toString();
      });
    });
  }

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  nextIndex() {
    if (_selectedIndex != 2) {
      _selectedIndex = _selectedIndex! + 1;
      setState(() {});
    } else {
      addItem();
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return WelcomePage();
        },
      ));
    }
  }

  beforeIndex() {
    if (_selectedIndex! > 0) {
      _selectedIndex = _selectedIndex! - 1;
      setState(() {});
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar(
        text: inputTitle[_selectedIndex!],
        // autoImplyReading: true,
        lead: IconButton(
            onPressed: () {
              beforeIndex();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: TextBox(
              title: "Nama",
              width: 2,
              controller: nameController,
              enabled: _selectedIndex == 0,
              color: Color.fromARGB(255, 22, 98, 160),
            ),
          ),
          SliverToBoxAdapter(
            child: TextBox(
              title: "No. HP",
              width: 2,
              controller: noHpController,
              enabled: _selectedIndex == 0,
              keyboardType: TextInputType.phone,
              color: Color.fromARGB(255, 22, 98, 160),
            ),
          ),
          SliverToBoxAdapter(
            child: (_selectedIndex == 0)
                ? TextBox(
                    enabled: false,
                    controller: datePick,
                    onTap: () {
                      _presentDatePicker();
                    },
                    hintText: "Pilih Tanggal",
                    title: "Tanggal Lahir",
                    width: 2,
                    keyboardType: TextInputType.datetime,
                    color: Color.fromARGB(255, 22, 98, 160),
                  )
                : TextBox(
                    title: "Tanggal Lahir",
                    enabled: false,
                    width: 2,
                    controller: datePick,
                    keyboardType: TextInputType.datetime,
                    color: Color.fromARGB(255, 22, 98, 160),
                  ),
          ),
          SliverToBoxAdapter(
            child: (_selectedIndex! > 0)
                ? TextBox(
                    title: "Merk Kendaraan",
                    width: 2,
                    controller: merkController,
                    enabled: _selectedIndex! == 1,
                    color: Color.fromARGB(255, 22, 98, 160),
                  )
                : SizedBox(),
          ),
          SliverToBoxAdapter(
            child: (_selectedIndex! > 0)
                ? TextBox(
                    title: "Nama Model",
                    controller: modelController,
                    width: 2,
                    enabled: _selectedIndex! == 1,
                    color: Color.fromARGB(255, 22, 98, 160),
                  )
                : SizedBox(),
          ),
          SliverToBoxAdapter(
            child: (_selectedIndex! > 1)
                ? (image.isEmpty)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              getImage();
                            },
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 150,
                              color: Color.fromARGB(255, 22, 98, 160),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 150,
                        width: 150,
                        child: InkWell(
                          onTap: () => getImage(),
                          child: Image.memory(
                            decodeImage(image),
                          ),
                        ),
                      )
                : null,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(
                horizontal: 75,
              ),
              child: OutlinedButton(
                onPressed: () {
                  nextIndex();
                },
                child: Text(
                  (_selectedIndex! < 2) ? 'Next' : 'Submit',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Color.fromARGB(255, 22, 98, 160),
                    width: 2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
