import 'package:flutter/material.dart';
import 'package:student/model/Student.dart';
import 'package:student/service/service.dart';
import 'package:student/main.dart';
import 'package:student/screens/update.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late List<Student> _contactlist;
  int temp=0;
  final _Service=Service();
  bool _visibility=false;
  int _count=0;
  getRecord() async{
    var students= await _Service.display();



    students.forEach((i){
      var structure=Student();
      structure.id=i['id'];
      structure.firstname=i['firstname'];
      structure.lastname=i['lastname'];
      structure.email=i['email'];
      structure.mobile=i['mobile'];
      structure.address=i['address'];
      _contactlist.add(structure);
      setState(() {
        _count=_count+1;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contactlist=<Student>[];

    getRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Contact Details'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _contactlist.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Column(
                  children: [
                    /*Text(_contactlist[index].id.toString()?? ''),
                      Text(_contactlist[index].name ?? ''),
                      Text(_contactlist[index].roll ?? ''),
                      Text(_contactlist[index].dept ?? ''),
                      Text(_contactlist[index].mobile ?? ''),
                      Text(_contactlist[index].age ?? ''),
                      Text(_contactlist[index].gender ?? ''),*/

                    // Row(
                    //   children: [
                    //     Container(
                    //       child: Text('S.No :'),
                    //     ),
                    //     Container(
                    //       child: Text(_contactlist[index].id.toString()?? ''),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('Name     : '),
                          ),
                          Container(
                            child: Text(_contactlist[index].firstname?? ''),
                          )
                        ],
                      ),

                    ),

                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         child:const Text('Last Name                  : '),
                    //       ),
                    //       Container(
                    //         child: Text(_contactlist[index].lastname?? ''),
                    //       )
                    //     ],
                    //   ),
                    //
                    // ),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child:const Text('Mobile          : '),
                          ),
                          Container(
                            child: Text(_contactlist[index].mobile?? ''),
                          )
                        ],
                      ),

                    ),
                    //
                    //
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         child:const Text('Email                         : '),
                    //       ),
                    //       Container(
                    //         child: Text(_contactlist[index].email?? ''),
                    //       )
                    //     ],
                    //   ),
                    //
                    // ),

                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         child: Text('Address    : '),
                    //       ),
                    //       Container(
                    //         child: Text(_contactlist[index].address?? ''),
                    //       )
                    //     ],
                    //   ),
                    //
                    // ),

                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Update(student: _contactlist[index],)));
                              },
                              child: Text('Edit'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: (){

                                int? id=_contactlist[index].id;
                                String? firstname=_contactlist[index].firstname;
                                var res= _Service.delete(id!);
                                Navigator.pop(context,res);
                                //showAlertBox(context, "Student $name record is Deleted");

                              },
                              child: Text('Delete'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red
                              ),
                            ),

                          ],
                        ),
                      ),
                    )




                  ],
                ),
              ),
            );

          }
      ),

    );
  }

}
/*
showAlertBox(BuildContext context, String S){
  AlertDialog alertDialog=AlertDialog(
    title: Text('Alert Box'),
    content: Text(S),
    actions: [
      ElevatedButton(onPressed: (){
        Navigator.of(context).pop(MaterialPageRoute(builder: (context)));
      },
          child: Text('Ok'))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      });
}*/