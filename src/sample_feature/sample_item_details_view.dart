import 'package:flutter/material.dart';
import 'package:myapp/src/sample_feature/sample_item.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SampleItem;
    String str = "";
    if (args.advanced){
      str = "Advanced Placement Class";
    } else{
      str = "Non-Advanced Placement Class";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(args.name),
        
        
      ),
      body: Center(
        child: Text(args.about, style: TextStyle(
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontFamily: 'Open Sans',
      fontSize: 15),),

      
      ),
      
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blueGrey,
        child: Container(height: 50.0, child: Text(str, textAlign: 
        TextAlign.center, 
        style: TextStyle(fontSize: 15, color: Colors.white,),
        )),
      ),
    );
  }
}
