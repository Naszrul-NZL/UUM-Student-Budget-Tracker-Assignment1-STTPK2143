import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
TextEditingController expenseController = TextEditingController();
TextEditingController budgetController = TextEditingController();

double budget=0.0;
double expense=0.0;
double result=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 46, 5),
        title: Text('UUM Student Budget Tracker',
        style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        ),
      
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(20.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Track Your Weekly Budget',
            style: TextStyle(fontSize: 50),),
            
            SizedBox(height: 30),

            Text('Remaining Balance: RM $result',
            style: TextStyle(fontSize: 25),
            ),

            Text('Total Spent              : RM $expense',
            style: TextStyle(fontSize: 25),
            ),

            SizedBox(height: 40),

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
                    hintText: ('Enter Your Expensed'),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),
          
              ElevatedButton(
                onPressed: (){
                  double currentBudget = double.tryParse(budgetController.text)?? 0.0;
                  double currentExpense = double.tryParse(expenseController.text)?? 0.0;
                  setState(() {
                    expense = expense + currentExpense;
                    result = currentBudget- expense;
                  });
                },
                child: const Text("Calculate"),
              ),
            ],
          ),    
         ),
      ),
    );
  }
}
