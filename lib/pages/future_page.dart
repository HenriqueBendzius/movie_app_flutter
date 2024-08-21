import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {

  Future<List<String>> getNames() async{
   await Future.delayed(const Duration(seconds: 5));
    return [
      'joão',
      'maria',
      'ana',
      'diego'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNames(),
      builder: (context, Snapshot){
          if(Snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(Snapshot.hasError){
            return const Center(child: Text('ocorreu um erro'),)
          }
          return ListView.builder(
            itemCount: Snapshot.data!.length ,
            itemBuilder: (context, index) {
              return Text(Snapshot.data![index]);

            },
          );
      },
    );
  }
}