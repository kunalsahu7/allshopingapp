import 'package:allshopingapp/screens/homescreen/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  homeprovider? Homeprovidertrue;
  homeprovider? Homeproviderfalse;
  @override
  Widget build(BuildContext context) {
    Homeproviderfalse = Provider.of<homeprovider>(context,listen: false);
    Homeprovidertrue = Provider.of<homeprovider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("All App Shoping"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'output screen',arguments: index);
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    Homeproviderfalse!.imagelist[index],
                  ),
                ),
              ),
            );
          },
          itemCount: Homeproviderfalse!.imagelist.length,
        ),
      ),
    );
  }
}
