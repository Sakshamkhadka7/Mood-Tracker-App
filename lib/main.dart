import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MoodTracker(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MoodTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Mood Tracker",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        
        actions:[
           IconButton(
            icon:Icon(Icons.info_outline),
            onPressed: () => 
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("This is a simple mood tracker App"),),
              )
            ,
           )
        ],

      ),
      body: Center(
    
    child: Card(
    elevation: 40,
     
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTnOfdXUZiZt-SQFv_a45fUjcYVHZ-9GxvMQ&s",
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 10,),
            Text("Track your mood daily",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
             SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoodScreen()),
                );
              },
              child: Text(
                "Go to Mood Screen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

    ) ,
           
         
        
     
      ),
    );
  }
}

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mood Tracker Screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          CircleAvatar(

            radius:40,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.mood,size: 50,color: Colors.white,),
          ),

          SizedBox(
            height: 20,
          ),

          Divider(
            thickness: 2,
            color: Colors.green,
            indent: 40,
            endIndent: 40,
          ),
           

            // show mood text
            Text(
              message,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),

            // 👇 Wrap handles overflow automatically
            Wrap(
              spacing: 20, // space between buttons
              runSpacing: 20, // space between rows if wrapped
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      message = "😊 You are feeling Happy";
                    });
                  },
                  child: Text("😊"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      message = "🥺 You are feeling Sad!";
                    });
                  },
                  child: Text("🥺"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      message = "😐 You are feeling Neutral!";
                    });
                  },
                  child: Text("😐"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      message = "🥵 You are feeling Hot!";
                    });
                  },
                  child: Text("🥵"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
