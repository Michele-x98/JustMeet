import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/view/authentication/login.dart';

class HomepageAnonima extends StatefulWidget{
  @override
    HomepageAnonimaState createState() => HomepageAnonimaState();
  }

class HomepageAnonimaState extends State<HomepageAnonima>{
  final DateFormat _df = DateFormat("H:m dd/MM/yyyy");
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:AppBar(
               backgroundColor: ThemeHandler.jmTheme().primaryColor,
               elevation: 10,
               title: Image.asset('assets/images/logo.png', scale: 2.5),
               centerTitle: true,
               ),
    body: FutureBuilder(
      future: ControllerJM.loadEvents(),
      builder: (BuildContext context, AsyncSnapshot<List<Evento>> snapshot) {
        if(snapshot.data == null)
        {
        return Container(
          child: Center(
                  child:CircularProgressIndicator()
                    )
        );
        }
        else
        {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              Evento evento = snapshot.data[index];
              return  SingleChildScrollView(
                        child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: ThemeHandler.jmTheme().secondaryHeaderColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                
                              Card(
                                elevation: 10,
                                
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  child: Column(
                                    
                                    children: <Widget>[
                                      ListTile(
                                  title: Text(evento.titolo),
                                  subtitle: Text(evento.descrizione),
                                  trailing: Icon(Icons.favorite_border), onTap: () => {}
                                  //Se loggato, salva l'evento tra i preferiti.
                                ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[

                                          //Inizio Evento
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2),
                                            child:Text(
                                              "Inizio Evento: " + _df.format(evento.inizioEvento),
                                              style: TextStyle(color: ThemeHandler.jmTheme().primaryColor)),
                                            decoration:BoxDecoration(
                                              border: Border.all(color: ThemeHandler.jmTheme().primaryColor),
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              color: ThemeHandler.jmTheme().accentColor),
                                            ),
                                          //Fine Evento
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2),
                                            decoration:BoxDecoration(
                                              border: Border.all(color: ThemeHandler.jmTheme().primaryColor),
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              color: ThemeHandler.jmTheme().accentColor),
                                            child: Text(
                                              "Fine Evento: " + _df.format(evento.fineEvento),
                                              style: TextStyle(color: ThemeHandler.jmTheme().primaryColor),
                                              )),
                                          //Posti Disponibili
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2),
                                            child:Text(
                                              "Posti disponibili: "+ evento.partecipanti.toString(),
                                              style: TextStyle(color: ThemeHandler.jmTheme().primaryColor),
                                              ),
                                            decoration:BoxDecoration(
                                              border: Border.all(color: ThemeHandler.jmTheme().primaryColor),
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              color: ThemeHandler.jmTheme().accentColor)
                                              ),
                                          //Topic
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2),
                                            decoration:BoxDecoration(
                                              border: Border.all(color: ThemeHandler.jmTheme().primaryColor),
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              color: ThemeHandler.jmTheme().accentColor), 
                                            child: Text(
                                              "Topic: "+ evento.idTopic.toString(),
                                              style: TextStyle(color: ThemeHandler.jmTheme().primaryColor),
                                                )
                                              ),
                                        ],
                                        ),
                                      
                              //          ListTile(
                              //           title:Text(_df.format(evento.inizioEvento)),
                              //           subtitle: Text(_df.format(evento.fineEvento)),
                              //           trailing: Text("Numero partecipanti:"+evento.partecipanti.toString() +"\n\nTopic: "+ evento.idTopic.toString()),
                              // ),
                                  ],),
                                ),
                              ),
                              RaisedButton(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                
                                ),

                                child: Text("ISCRIVITI"),
                                color: ThemeHandler.jmTheme().accentColor,
                                onPressed: ()=>{}
                                //,
                              ),
                            ],
                            ),
                          ),
                        ),
                        );
                      },
            itemCount: snapshot.data.length,
            separatorBuilder: (context, index) => Divider(),
            );
        }

        },
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: ThemeHandler.jmTheme().accentColor,
      child: Icon(Icons.account_box, color: ThemeHandler.jmTheme().primaryColor),
      onPressed: () => { 
       // BottomSheet(builder: (BuildContext context) { return BS(); }, onClosing: () {  },),
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) { return FractionallySizedBox(
                    heightFactor: 0.8,
                    child: LoginPage()); },
                  isScrollControlled: true),
                //Fluttertoast.showToast(msg: "ciao"),
                //Navigator.pushNamed(context, "/login"),
        
              }
            ));          
        
          }
        
        @override
        void initState() {super.initState();}
        }
        
      class BS extends StatefulWidget {
      _BS createState() => _BS();
    }

    class _BS extends State<BS> {
      bool _showSecond = false;

      @override
      Widget build(BuildContext context) {
        return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) => AnimatedContainer(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)),
            child: AnimatedCrossFade(
                firstChild: Container(
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height - 200),
//remove constraint and add your widget hierarchy as a child for first view
                  padding: EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      onPressed: () => setState(() => _showSecond = true),
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Suivant"),
                        ],
                      ),
                    ),
                  ),
                ),
                secondChild: Container(
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height / 3),
//remove constraint and add your widget hierarchy as a child for second view
                  padding: EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      onPressed: () => setState(() => _showSecond = false),
                      color: Colors.green,
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("ok"),
                        ],
                      ),
                    ),
                  ),
                ),
                crossFadeState: _showSecond
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 400)),
            duration: Duration(milliseconds: 400),
          ),
        );
      }
    }