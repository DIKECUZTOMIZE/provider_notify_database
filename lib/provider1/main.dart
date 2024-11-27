import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/provider1/counter_provider.dart';


/// State Management: base
void main() {

  /// HomePage dore inject kora hoise
  runApp( ChangeNotifierProvider(create: (context) => CounterProvider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      /// inject kora hoise:
      /// creat pass kora hobo provider r dhara
      /// by default creat tahke aru call back function t ami bonua provider classtu retrun kora hobo aru
      /// call back through  priver pass kora hobo:
      /// mane ate hoise homepage oport changnityfy class use kora hoise aru counterprovider
      /// inject kora hoise:
       home:
      // ChangeNotifierProvider(create:(context) => CounterProvider(),
      //
      //    /// paranet widget
      //    ///   jiman Myhomepage r child bur counterprovuder t excuted kuribo pare atia
      //     child:
           MyHomePage(),
     // ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            /// countinusely khuni thakibo pabo Lisnter karon :
            /// Ui t dekha jabo  aru jatia jatia button a value change ,notify kore
            /// text a value rebilt kuri tahkibo lagibo
            /// value get :Data refelction hobo : lisnter
            Text(
              // listen true mane khuni thoka hoise:
              '${Provider.of<CounterProvider>(context,listen: true).getcountValue()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),


      /// aite lisnter kora nhoi karon e okl value change huar pasot value notify korai
      /// tarpisot text notify puar pasot valur get kore
      floatingActionButton: FloatingActionButton(

        /// inceremnet kora hobo:
        onPressed:(){

        //   /// data change hobo ate
        //
        //   /// Parent widget r dhara counterprovider r value get korar r talika ase jene:
        //
        //   /// dot of  mane hoise  context r pora parentr jikunu function cll kora ru jikunu
        //   /// feature k access kora ,jene: media . of ,
        //   /// provider ok access kora tuke provider .of  context buli kua hoi
        //   /// aru ai context ote ami prent class t jabo pari
        //
        //   Provider.of
        //
        // //  kenekua dhoronr privider call kora hoise  type defind kora hoi
        //   // aspect kopra hoise incrementcount mane feature access kora hoise
        //   // listen false kora hoise jate khuni nathake,
        //   // by dafault  listen hoi tahke context
        //   <CounterProvider>(context,listen: false).incremnetCount();

           Navigator.push(context, MaterialPageRoute(builder: (context) =>SecondPage() ,));

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


/// dfendency inject:
/// 1.HomePage, scaffold


/// jot ami lisent aru value change kuribo khujiso tare common parent hoise :
/// Scaffold ,HomePage


class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add  Count'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Provider.of<CounterProvider>(context,listen: false).incremnetCount();
        }, child: Text('Add')),
      ),
    );
  }
}

/// Hghricy
/// error karontu  hoise : firstPage t  prover widget  use kora hoise  khaikarone  first pagot
/// khokulote eplement kuribo pare but ami implement kuribo khujisu je second page kintu second page t
/// access kuribo nuare khai karone  error hoise ,problm tu secodr ,
/// kaikarone homepager notifytu remov kuri  tawlukur parent class t used kuribo lagino
/// jate highricy inharitance hoi, (child)first page aru secod page r common parent hoise app tu ,
/// aite judi use kuru  tatia seconf page rebilt hua dekha jabo,