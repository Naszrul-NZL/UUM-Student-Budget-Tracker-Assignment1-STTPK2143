import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UUM Student Budget Tracker',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Budget Tracker Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  TextEditingController expenseController = TextEditingController();
  TextEditingController budgetController = TextEditingController();

  double budget=0.0;
  double expense=0.0;
  double result=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 29, 182),
        title: Text('UUM Student Budget Tracker',
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
        centerTitle: true,
        ),
      
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(20.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_uum.png',height: 125),
            
            SizedBox(height: 20),

            const Text('Track Your Weekly Budget',
            style: TextStyle(fontSize: 30),),
            
            SizedBox(height: 60),

            Text('Remaining Balance: RM $result',
            style: TextStyle(fontSize: 25),
            ),

            Text('Total Spent              : RM $expense',
            style: TextStyle(fontSize: 25),
            ),

            SizedBox(height: 70),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width:(300),  
                child: TextField(
                  controller: budgetController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: ('Enter Your Weekly Budget'),
                  ),
                ),
                ),


                SizedBox(
                  width: (300),
                  child: TextField(
                    controller: expenseController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                    hintText: ('Enter Your Expenses'),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),
          
              ElevatedButton(
                onPressed: (){
                  playme();
                  double currentBudget = double.tryParse(budgetController.text)?? 0.0;
                  double currentExpense = double.tryParse(expenseController.text)?? 0.0;
                  setState(() {
                    expense = expense + currentExpense;
                    result = currentBudget- expense;
                  });
                },
                child: const Text("Calculate"),
              ),
              SizedBox(height: 150),
            ],
          ),    
         ),
      ),
    );
  }

  void playme(){
    player.play(AssetSource('audios/mixkit-sci-fi-click-900.wav'));
  }

}
