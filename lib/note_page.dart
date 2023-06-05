import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController controller = TextEditingController();

  List<String> names = [];

  @override
  Widget build(BuildContext context) {
    print(names);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Note App"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text("My AlertDialog"),
                            content: TextField(
                              decoration:
                                  const InputDecoration(hintText: "Enter Name"),
                              controller: controller,
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {});
                                    names.add(controller.text);

                                    controller.clear();
                                    print(names);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Save"))
                            ],
                          ));
                },
                child: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
              child: Card(
                child: ListTile(
                  title: Text(names[index]),
                  trailing: SizedBox(
                    width: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              controller.text = names[index];
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text("My AlertDialog"),
                                        content: TextField(
                                          decoration: const InputDecoration(
                                              hintText: "Enter Name"),
                                          controller: controller,
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {});
                                                names[index] = controller.text;
                                                controller.clear();
                                                print(names);
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Update"))
                                        ],
                                      ));
                            },
                            child: const Icon(Icons.edit, color: Colors.red)),
                        InkWell(
                            onTap: () {
                              setState(() {
                                names.removeAt(index);
                              });
                            },
                            child: const Icon(Icons.delete, color: Colors.red))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
