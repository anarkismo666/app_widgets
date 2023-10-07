import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const name = "ui_controls_screen";
  
  const UIControlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("UI Varios controles"),
        ),
        body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

// Enumeración para radiobutton
enum Trasportation {car, plane, boat, submarine}

class _UIControlsViewState extends State<_UIControlsView> {

  // Para Switch
  bool isDeveloper = true;

  // Para radiobutton
  Trasportation selectedTransportation = Trasportation.car;

  // Para checkbox
  bool wantsBreakFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
          SwitchListTile(
            title: const Text("Developer mode"),
            subtitle: const Text("Switch"),
            value: isDeveloper, 
            onChanged: (value) {
                setState(() {
                    isDeveloper = !isDeveloper;
                });
            },
          ),
          ExpansionTile(
              title: const Text("Vehiculo de transporte"),
              subtitle: Text('$selectedTransportation'),
              children: [

                      RadioListTile(
                          title: const Text("By car"),
                          subtitle: const Text("Viajar en coche"),
                          value: Trasportation.car, 
                          groupValue: selectedTransportation, 
                          onChanged: (value) {
                              setState(() {
                                  selectedTransportation = Trasportation.car;
                              });
                          },
                      ),
                      RadioListTile(
                          title: const Text("By boat"),
                          subtitle: const Text("Viajar en bote"),
                          value: Trasportation.boat, 
                          groupValue: selectedTransportation, 
                          onChanged: (value) {
                              setState(() {
                                  selectedTransportation = Trasportation.boat;
                              });
                          },
                      ),
                      RadioListTile(
                          title: const Text("By plane"),
                          subtitle: const Text("Viajar en avion"),
                          value: Trasportation.plane, 
                          groupValue: selectedTransportation, 
                          onChanged: (value) {
                              setState(() {
                                  selectedTransportation = Trasportation.plane;
                              });
                          },
                      ),
                      RadioListTile(
                          title: const Text("By submarine"),
                          subtitle: const Text("Viajar en submarino"),
                          value: Trasportation.submarine, 
                          groupValue: selectedTransportation, 
                          onChanged: (value) {
                              setState(() {
                                  selectedTransportation = Trasportation.submarine;
                              });
                          },
                      ),
      
              ],
          ),

          CheckboxListTile(
              title: const Text("Incluir desayuno?"),
              value: wantsBreakFast, 
              onChanged: (value) {
                  setState(() {
                      wantsBreakFast = !wantsBreakFast;
                  });
              },
          ),
          CheckboxListTile(
              title: const Text("Incluir Lunch?"),
              value: wantsLunch, 
              onChanged: (value) {
                  setState(() {
                      wantsLunch = !wantsLunch;
                  });
              },
          ),
          CheckboxListTile(
              title: const Text("Incluir cena?"),
              value: wantsDinner, 
              onChanged: (value) {
                  setState(() {
                      wantsDinner = !wantsDinner;
                  });
              },
          ),
      ],
    );
  }
}