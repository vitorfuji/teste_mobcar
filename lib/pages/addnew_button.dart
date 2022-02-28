import 'package:flutter/material.dart';

class AddNewButton extends StatefulWidget {
  const AddNewButton({Key? key}) : super(key: key);

  @override
  State<AddNewButton> createState() => _AddNewButtonState();
}

class _AddNewButtonState extends State<AddNewButton> {
  final items = ['Item 1, Item 2, Item 3, Item 4'];

  String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: SizedBox(
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.black),
          ),
          child: const Text(
            'Add new',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      IconButton(
                        iconSize: 25.0,
                        icon: const Icon(
                          Icons.car_repair,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          null;
                        },
                      ),
                      const Text(
                        'Title',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 24, left: 24, right: 24),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/6015/6963/efaec74c542b0ea5e5a65d731fff89a2?Expires=1646611200&Signature=JbO7dq5k2Fi5cARpCjJSIvydd6XHz00vZYcXrhMiTR2~8OdahRJ-k9Z2gHqo8RjZullxPuPfiIkzEAz7Sx1TNJC7Udnkj6NU~VHmQ1OAAdsqsQV91TP8mhQCvIHpRCE-YqYwlZt7EtxhuAc6W0GTiF6jdR-B9jcYmQACX3IVch8S7sQRTCH-XQBbiUoWPwjPf3ia8DNisqxzUlRM662hdXYlGu9ZJXS4lGwMRxAq3jZWPQ32OGxDy3Teao67uIyfVw7bBHEfHphWxphV9DGDQ7-kYlrGvtUYTdRJUEFMmRraFZ1MgiJSuuaZDIhiQAq3zVpcyk9u0JMxa4iGdVULTA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value,
                          iconSize: 24,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            print('Cancelado'); //corrigir depois
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.black),
                            ),
                            child: const Text(
                              'Salvar',
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              print('Salvo'); //corrigir depois
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
