import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Offer extends StatefulWidget {
  const Offer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  TextEditingController salaire_mensuel_brut = TextEditingController();
  TextEditingController salaire_annuel_brut = TextEditingController();
  TextEditingController salaire_horaire_brut = TextEditingController();
  TextEditingController salaire_mensuel_net = TextEditingController();
  TextEditingController salaire_annuel_net = TextEditingController();
  TextEditingController salaire_horaire_net = TextEditingController();
  TextEditingController Slider_time = TextEditingController();
  TextEditingController Slider_taux = TextEditingController();
  TextEditingController salaire_mensuel_net_apres_impot = TextEditingController();
  TextEditingController salaire_annuel_net_apres_impot = TextEditingController();

  int? _valuechoicechip = 0;

  int? _valuechoicechipprime = 0;

  double _value_one = 0;

  double _value_two = 0;

  Color _statusColor_one = Colors.amber;

  Color _statusColor_two = Colors.amber;

  double horaire_brut = 0;
  double horaire_net = 0;
  double mensuel_brut = 0;
  double mensuel_net = 0;
  double annuel_brut = 0;
  double annuel_net = 0;
  double mensuel_net_apres_impot = 0;
  double annuel_net_apres_impot = 0;

  List<String> options = [
    'Non Cadre',
    'Cadre',
    'Fonction Publique',
    'Profession Libérale',
    'Portage Salarial'
  ];

  List<String> options_prime = [
    '12 mois',
    '13 mois',
    '14 mois',
    '15 mois',
    '16 mois',
  ];

  // Fonction pour passer du brut au net
  void updatePaybruttonet(String text){
    if (text != "") {
      double sb = (double.parse(salaire_horaire_brut.text));
      if (text=="Cadre"){
        salaire_horaire_net.text = (sb*0.75).toStringAsFixed(2);
      }
      else if(text=="Non Cadre"){
        salaire_horaire_net.text = (sb*0.78).toStringAsFixed(2);
      }
      else if(text=="Fonction Publique"){
        salaire_horaire_net.text = (sb*0.85).toStringAsFixed(2);
      }
      else if(text=="Profession Libérale"){
        salaire_horaire_net.text = (sb*0.55).toStringAsFixed(2);
      }
      else if(text=="Portage Salarial"){
        salaire_horaire_net.text = (sb*0.49).toStringAsFixed(2);
      }
      mensuel_net = double.parse(salaire_horaire_net.text) * ((_value_one * 151.67)/100);
      salaire_mensuel_net.text = mensuel_net.toStringAsFixed(2);

      mensuel_brut = sb * ((_value_one * 151.67)/100);
      salaire_mensuel_brut.text = mensuel_brut.toStringAsFixed(2);

      annuel_brut = mensuel_brut * (_valuechoicechipprime! + 12);
      salaire_annuel_brut.text = annuel_brut.toStringAsFixed(2);

      annuel_net = mensuel_net * (_valuechoicechipprime! + 12);
      salaire_annuel_net.text = annuel_net.toStringAsFixed(2);

      mensuel_net_apres_impot = mensuel_net - (mensuel_net * (_value_two/100));
      salaire_mensuel_net_apres_impot.text = mensuel_net_apres_impot.toStringAsFixed(2);

      annuel_net_apres_impot = annuel_net - (annuel_net * (_value_two/100));
      salaire_annuel_net_apres_impot.text = annuel_net_apres_impot.toStringAsFixed(2);

      if(mensuel_brut <= 1440){
        _value_two = 0;
      }
      else if(mensuel_brut > 1440 && mensuel_brut < 1496){
        _value_two = 0.5;
      }
      else if(mensuel_brut > 1496 && mensuel_brut < 1592){
        _value_two = 1.3;
      }
      else if(mensuel_brut > 1592 && mensuel_brut < 1699){
        _value_two = 2.1;
      }
      else if(mensuel_brut > 1699 && mensuel_brut < 1816){
        _value_two = 2.9;
      }
      else if(mensuel_brut > 1816 && mensuel_brut < 1913){
        _value_two = 3.5;
      }
      else if(mensuel_brut > 1913 && mensuel_brut < 2040){
        _value_two = 4.1;
      }
      else if(mensuel_brut > 2040 && mensuel_brut < 2414){
        _value_two = 5.3;
      }
      else if(mensuel_brut > 2414 && mensuel_brut < 2763){
        _value_two = 7.5;
      }
      else if(mensuel_brut > 2763 && mensuel_brut < 3147){
        _value_two = 9.9;
      }
      else if(mensuel_brut > 3147 && mensuel_brut < 3543){
        _value_two = 11.9;
      }
      else if(mensuel_brut > 3543 && mensuel_brut < 4134){
        _value_two = 13.8;
      }
      else if(mensuel_brut > 4134 && mensuel_brut < 4956){
        _value_two = 15.8;
      }
      else if(mensuel_brut > 4956 && mensuel_brut < 6202){
        _value_two = 17.9;
      }
      else if(mensuel_brut > 6202 && mensuel_brut < 7747){
        _value_two = 20;
      }
      else if(mensuel_brut > 7747 && mensuel_brut < 10752){
        _value_two = 24;
      }
      else if(mensuel_brut > 10752 && mensuel_brut < 14563){
        _value_two = 28;
      }
      else if(mensuel_brut > 14563 && mensuel_brut < 22860){
        _value_two = 33;
      }
      else if(mensuel_brut > 22860 && mensuel_brut < 48967){
        _value_two = 38;
      }
      else if(mensuel_brut >= 48967){
        _value_two = 43;
      }
      else {
        _value_two = 0;
      }
    } else {
        salaire_horaire_net.text = "";
    }
  }
  // Fonction pour passer du net au brut
  void updatePaynettobrut(String text){
    if (text != "") {
      double sb = (double.parse(salaire_horaire_net.text));
      if (text=="Cadre"){
          salaire_horaire_brut.text = (sb / 0.75).toStringAsFixed(2);
      }
      else if(text=="Non Cadre"){
          salaire_horaire_brut.text = (sb / 0.78).toStringAsFixed(2);
      }
      else if(text=="Fonction Publique"){
          salaire_horaire_brut.text = (sb / 0.85).toStringAsFixed(2);
      }
      else if(text=="Profession Libérale"){
          salaire_horaire_brut.text = (sb / 0.55).toStringAsFixed(2);
      }
      else if(text=="Portage Salarial"){
          salaire_horaire_brut.text = (sb / 0.49).toStringAsFixed(2);
      }
      mensuel_brut = double.parse(salaire_horaire_brut.text) * ((_value_one * 151.67)/100);
      salaire_mensuel_brut.text = mensuel_brut.toStringAsFixed(2);

      mensuel_net = sb * ((_value_one * 151.67)/100);
      salaire_mensuel_net.text = mensuel_net.toStringAsFixed(2);

      annuel_net = mensuel_net * (_valuechoicechipprime! + 12);
      salaire_annuel_net.text = annuel_net.toStringAsFixed(2);

      annuel_brut = mensuel_brut * (_valuechoicechipprime! + 12);
      salaire_annuel_brut.text = annuel_brut.toStringAsFixed(2);

    } else {
        salaire_horaire_brut.text = "";
    }
  }

  // J'ai créé mon choicechip pour que cela sois plus simple à utiliser
  Widget categoriesList(BuildContext context) {

    return Wrap(
      spacing: 25,
      runSpacing: 25,
      children: List<Widget>.generate(
        options.length,
            (int idx) {
          return ChoiceChip(
              label: Text(options[idx]),
              labelStyle: const TextStyle(color: Colors.white,letterSpacing: 2),
              selected: _valuechoicechip == idx,
              avatar: const Icon(Icons.person, color: Colors.white, size: 20),
              backgroundColor: Colors.black54,
              padding: const EdgeInsets.all(15),
              selectedColor: Colors.blue,
              onSelected: (bool selected) {
                setState(() {
                  _valuechoicechip = selected ? idx : 0;
                  updatePaybruttonet(options[idx]);
                }
              );
            }
          );
        },
      ).toList(),
    );
  }

  Widget categoriesPrime(BuildContext context) {

    return Wrap(
      spacing: 25,
      runSpacing: 25,
      children: List<Widget>.generate(
        options_prime.length,
            (int idx) {
          return ChoiceChip(
              label: Text(options_prime[idx]),
              labelStyle: const TextStyle(color: Colors.white,letterSpacing: 2),
              selected: _valuechoicechipprime == idx,
              avatar: const Icon(Icons.person, color: Colors.white, size: 20),
              backgroundColor: Colors.black54,
              padding: const EdgeInsets.all(15),
              selectedColor: Colors.blue,
              onSelected: (bool selected) {
                setState(() {
                  _valuechoicechipprime = selected ? idx : 0;
                  updatePaybruttonet(options_prime[idx]);
                }
                );
              }
          );
        },
      ).toList(),
    );
  }

  // Le contenu de ma page
  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    // je l'utilise pour que l'écran s'adapte entre un écran d'ordinateur et un téléphone

    return Scaffold(
        backgroundColor: const Color.fromRGBO(63, 68, 75, 1),
        body: Center(
          child:SingleChildScrollView(
          child: Container(

            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(15.0),

            decoration: BoxDecoration(
            color: const Color.fromRGBO(63, 68, 75, 1),
            border: Border.all(
            color: const Color.fromRGBO(78, 83, 91, 1),
            width: 4.0,
            style: BorderStyle.solid),
            //Border.all
            borderRadius: const BorderRadius.all(
            Radius.circular(6),
            ), //BorderRadius.all
            ),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox( height: 25.0, ),
                    Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 16.0, // gap between lines
                      runAlignment: WrapAlignment.start, // default
                      children: <Widget>[
                        SizedBox(
                          width : 730,
                          child:TextFormField(
                          controller: salaire_horaire_brut,
                          onChanged:(text){ updatePaybruttonet(options[_valuechoicechip!]);},
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.white38,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                              ),
                              labelText: "Salaire Horaire Brut",
                              hintStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                              ),
                              hintText: 'Entrer du texte',
                              icon: const Icon(Icons.attach_money_rounded, color: Colors.green, size: 35),
                              border: const OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez saisir le salaire brut';
                            }
                            return null;
                          },
                        ),
                        ),
                        SizedBox(
                          width : 730,
                          child:TextFormField(
                            controller: salaire_horaire_net,
                            onChanged:(text){ updatePaynettobrut(options[_valuechoicechip!]);},
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white38,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                labelText: "Salaire Horaire Net",
                                hintStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                hintText: 'Entrer du texte',
                                icon: const Icon(Icons.attach_money_rounded, color: Colors.green, size: 35),
                                border: const OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir le salaire net';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width : 730,
                          child:TextFormField(
                            controller: salaire_mensuel_brut,
                            onChanged:(text){ updatePaybruttonet(options[_valuechoicechip!]);},
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white38,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                labelText: "Salaire Mensuel Brut",
                                hintStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                hintText: 'Entrer du texte',
                                icon: const Icon(Icons.attach_money_rounded, color: Colors.green, size: 35),
                                border: const OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir le salaire brut';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width : 730,
                          child:TextFormField(
                            controller: salaire_mensuel_net,
                            onChanged:(text){ updatePaynettobrut(options[_valuechoicechip!]);},
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white38,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                labelText: "Salaire Mensuel Net",
                                hintStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                hintText: 'Entrer du texte',
                                icon: const Icon(Icons.attach_money_rounded, color: Colors.green, size: 35),
                                border: const OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir le salaire net';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width : 730,
                          child:TextFormField(
                            controller: salaire_annuel_brut,
                            onChanged:(text){ updatePaybruttonet(options[_valuechoicechip!]);},
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white38,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                labelText: "Salaire Annuel Brut",
                                hintStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                hintText: 'Entrer du texte',
                                icon: const Icon(Icons.attach_money_rounded, color: Colors.green, size: 35),
                                border: const OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir le salaire brut';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width : 730,
                          child:TextFormField(
                            controller: salaire_annuel_net,
                            onChanged:(text){ updatePaynettobrut(options[_valuechoicechip!]);},
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white38,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                labelText: "Salaire Annuel Net",
                                hintStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                hintText: 'Entrer du texte',
                                icon: const Icon(Icons.attach_money_rounded, color: Colors.green, size: 35),
                                border: const OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir le salaire net';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox( height: 20.0, ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox( width: 20.0, ),
                        Expanded(
                          child:Container(
                            margin: const EdgeInsets.only(left:35, bottom: 0, right: 0, top:0),
                            child:Text(
                              'Sélectionnez votre statue : ' + options[_valuechoicechip!],
                              style: const TextStyle(color: Colors.white ,fontSize: 16,letterSpacing: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox( height: 20.0, ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 35),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 40,
                          width: deviceWidth * 0.69,
                          child:RawScrollbar(
                            controller: _scrollController1,
                            thumbColor: Colors.cyanAccent,
                            radius: const Radius.circular(20),
                            thickness: 5,
                            isAlwaysShown: true,
                            child:ListView(
                              controller: _scrollController1,
                              scrollDirection: Axis.horizontal,
                              children:[
                                categoriesList(context),
                              ]
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox( height: 20.0, ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time, color: Colors.white, size: 35),
                        const SizedBox( width: 20.0, ),
                        Expanded(
                          child:Text(
                            'Sélectionnez votre temps de travail : ${_value_one.round()} %',
                            style: TextStyle(color: _statusColor_one,fontSize: 16,letterSpacing: 2),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 1380,
                      child:Slider(
                        min: 0.0,
                        max: 100.0,
                        value: _value_one,
                        divisions: 10,
                        onChanged: (value) {
                          setState(() {
                            _value_one = value;
                            _statusColor_one = Colors.green;
                            updatePaybruttonet(options[_valuechoicechip!]);
                          });
                        },
                      ),
                    ),
                    const SizedBox( height: 20.0, ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox( width: 20.0, ),
                        Expanded(
                          child:Container(
                            margin: const EdgeInsets.only(left:35, bottom: 0, right: 0, top:0),
                            child:Text(
                              'Sélectionnez le nombre de mois de prime conventionnelle : ' + options_prime[_valuechoicechipprime!],
                              style: const TextStyle(color: Colors.white ,fontSize: 16,letterSpacing: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox( height: 20.0, ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 35),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 40,
                          width: deviceWidth * 0.69,
                          child:RawScrollbar(
                            controller: _scrollController2,
                            thumbColor: Colors.cyanAccent,
                            radius: const Radius.circular(20),
                            thickness: 5,
                            isAlwaysShown: true,
                            child:ListView(
                                controller: _scrollController2,
                                scrollDirection: Axis.horizontal,
                                children:[
                                  categoriesPrime(context),
                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox( height: 20.0, ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.autorenew, color: Colors.redAccent, size: 35),
                        const SizedBox( width: 20.0, ),
                        Expanded(
                          child:Text(
                            'Voici le taux de prélèvement à la source : ' + _value_two.toStringAsFixed(1) + ' %',
                            style: TextStyle(color: _statusColor_two,fontSize: 16,letterSpacing: 2),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 1380,
                      child:Slider(
                        min: 0.0,
                        max: 43.0,
                        value: _value_two,
                        divisions: 430,
                        onChanged: (value) {updatePaybruttonet(options[_valuechoicechip!]);
                          setState(() {
                            _value_two = value;
                            _statusColor_two = Colors.green;
                          });
                        },
                      ),
                    ),
                    const SizedBox( height: 20.0, ),
                    Center(
                    child:Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 16.0, // gap between lines
                      runAlignment: WrapAlignment.start, // default
                      children: <Widget>[
                        SizedBox(
                          width: 730,
                          child:TextFormField(
                            controller: salaire_mensuel_net_apres_impot,
                            onChanged:(text){updatePaybruttonet(options[_valuechoicechip!]);},
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white38,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                    color: Colors.white,letterSpacing: 2,
                                ),
                                labelText: "Mensuel Net Après Impôts",
                                hintStyle: const TextStyle(
                                    color: Colors.white,letterSpacing: 2,
                                ),
                                hintText: 'Entrer du texte',
                                icon: const Icon(Icons.attach_money_rounded, color: Colors.green, size: 35),
                                border: const OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir le salaire net';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 730,
                          child:TextFormField(
                            controller: salaire_annuel_net_apres_impot,
                            onChanged:(text){ updatePaybruttonet(options[_valuechoicechip!]);},
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white38,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                labelText: "Annuel Net Après Impôts",
                                hintStyle: const TextStyle(
                                  color: Colors.white,letterSpacing: 2,
                                ),
                                hintText: 'Entrer du texte',
                                icon: const Icon(Icons.attach_money_rounded, color: Colors.green, size: 35),
                                border: const OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir le salaire net';
                              }
                              return null;
                            },
                          ),
                        ),
                        ],),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 220,
                              height: 100,
                              child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue
                                    ),
                                    onPressed: () {
                                       salaire_mensuel_brut.clear();
                                       salaire_annuel_brut.clear();
                                       salaire_horaire_brut.clear();
                                       salaire_mensuel_net.clear();
                                       salaire_annuel_net.clear();
                                       salaire_horaire_net.clear();
                                       Slider_time.clear();
                                       Slider_taux.clear();
                                       salaire_mensuel_net_apres_impot.clear();
                                       salaire_annuel_net_apres_impot.clear();
                                    },
                                    child: const Text('Réinitialiser',
                                      style: TextStyle(fontSize: 18, color: Colors.white, letterSpacing: 2),),

                                  )
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}