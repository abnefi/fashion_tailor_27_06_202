import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCommandes extends StatefulWidget {
  static String tagDetailsCommandes = 'tagDetailsCommandes';

  @override
  _DetailsCommandesState createState() => _DetailsCommandesState();
}

class TenueAjouter {
  //
  String avatarTenue = '';

  TenueAjouter({this.avatarTenue});
}

class _DetailsCommandesState extends State<DetailsCommandes> {

  List<TenueAjouter> listeDesTenues;


  @override
  void initState() {
    super.initState();
    listeDesTenues = List();
    addTenues();
  }

  addTenues() {
    listeDesTenues.add(TenueAjouter(
      avatarTenue: 'modele_femme_image1.jpg',
    ));
    listeDesTenues.add(TenueAjouter(
      avatarTenue: 'modele_femme_image2.jpg',
    ));
  }

  Widget listetenues() {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listeDesTenues.length,
      itemBuilder: (context, index) {
        TenueAjouter item = listeDesTenues[index];
        int chiffre = 1;
        chiffre += index;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
          child: Dismissible(
            key: ValueKey(item),
            background: Container(
              child:
              // IconSlideAction(
              //   icon: Icons.delete,
              //   caption: 'Supprimer',
              //   color: Colors.redAccent,
              // ),
              SlidableAction(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Share',
              ),
              color: Colors.red,
            ),
            onDismissed: (direction){
              setState(() {
                listeDesTenues.removeAt(index);
              });

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Tenue '+'${chiffre} supprimé'),
                action: SnackBarAction(
                  label: 'Annulé',
                  onPressed: () {
                    setState(() {
                      listeDesTenues.insert(index, item);
                    });
                  },
                ),
              ));
            },
            child: Card(
              elevation: 1.0,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: ListTile(
                onTap: () {
                  return _voirDetailTenue('Tenue '+'$chiffre');
                },
                title: Text('Tenue '+'${chiffre}'),
                leading: CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/${item.avatarTenue}'),
                  radius: 25,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _voirDetailTenue(String titre){

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              titre,
              style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Photo du tissu',
                    style: TextStyle(
                        fontSize: 15, color: Colors.lightBlue),
                  ),
                  SizedBox(height: 15.0,),
                  Center(
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/modele_femme_image3.jpg'),
                        fit: BoxFit.contain,
                        height: 150,
                      ),
                    ),
                  ),
                  SizedBox(height: 45.0,),
                  Text(
                    'Photo du modèle',
                    style: TextStyle(
                        fontSize: 15, color: Colors.lightBlue),
                  ),
                  SizedBox(height: 15.0,),
                  Center(
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/modele_femme_image5.jpg'),
                        fit: BoxFit.contain,
                        height: 150,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  Row(
                    children: <Widget>[
                      Text(
                        'Type de tenue :',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                          'Manche courte'
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Observation',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Manche courte avec une broderie, colle mahot'
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Annuler',
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {

                },
                child: Text(
                  'Modifier',
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    final appbarDetailsCommande = AppBar(
      title: Text('Info commande'),
    );

    return Scaffold(
      appBar: appbarDetailsCommande,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/modele_femme_image4.jpg'),
                        radius: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('LEWHE Habib',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                        SizedBox(height: 10.0,),
                        Text('M, Noir',style: TextStyle(fontSize: 18.0),),
                        SizedBox(height: 10.0,),
                        Text('61951451',style: TextStyle(fontSize: 18.0),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 15.0),
                child:
                Text(
                  'Details de la commande',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontFamily: 'Roboto Medium',
                    fontSize: 15,
                  ),
                ),
              ),
              Divider(color: Colors.lightBlue,height: 0.0,),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                          'Date de la commande'
                      ),
                      subtitle: Text(
                          '2020-05-12'
                      ),
                      trailing: Icon(Icons.mode_edit),
                    ),
                    ListTile(
                      title: Text(
                          'Date de livraison'
                      ),
                      subtitle: Text(
                          '2020-05-15'
                      ),
                      trailing: Icon(Icons.mode_edit),
                    ),
                    Container(
                      padding: EdgeInsets.all( 10.0),
                      child: Text(
                        'Tenues ajoutée(s)',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.lightBlue
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: listetenues(),
                    )
                    /*Container(
                      margin: EdgeInsets.only(left: 10.0, top: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                      ),
                      child: FlatButton(
                          child: Text(
                            'Tenue(s) commandé(s)',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        onPressed: (){
                        },
                      ),
                    ),*/
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
