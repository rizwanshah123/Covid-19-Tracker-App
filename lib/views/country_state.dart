import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:covid_tracker_app/services/states_services.dart';

import '../widget/resuable_card.dart';
import '../widget/text_container.dart';

class CountryRecord extends StatefulWidget {
final  String country;
final  String active;
 final String death;
 final String recover;
  final String todayCases;
  final String todayDeaths;
  final String totalTests;
  final String testPerOneMillion;
  final  String casesPerOneMillion;
  final String deathsPerOneMillion;
  final String criticalCases;
  const CountryRecord({
    Key? key,
    required this.country,
    required this.active,
    required this.death,
    required this.recover,
    required this.todayCases,
    required this.todayDeaths,
    required this.totalTests,
    required this.testPerOneMillion,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.criticalCases,
  }) : super(key: key);

  @override
  State<CountryRecord> createState() =>
      _CountryRecordState();
}

class _CountryRecordState extends State<CountryRecord> {
  _CountryRecordState({Key? key,});

 


  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd-MM');
  final String formatted = formatter.format(now);
  final colorList = [Colors.yellow, Colors.red, Colors.green];

  StatesServices statesServices = StatesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: FutureBuilder(
              future: statesServices.fetchWorldStatesRecords(),
              builder: (context,snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                       Padding(
                        padding:const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Text('Covid 19 ${widget.country} Percentage',
                            style:const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blueGrey)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, top: 10.0, right: 20.0),
                        height: MediaQuery.of(context).size.height * .4,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 243, 225, 239),
                                  Color.fromARGB(255, 231, 228, 229)
                                ])),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            PieChart(
                                chartValuesOptions: const ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                  showChartValuesOutside: true,
                                ),
                                colorList: colorList,
                                chartRadius: 200.0,
                                legendOptions: const LegendOptions(
                                    showLegendsInRow: true,
                                    legendPosition: LegendPosition.bottom),
                                ringStrokeWidth: 30.0,
                                chartLegendSpacing: 50,
                                chartType: ChartType.ring,
                                dataMap: {
                                  'Active': double.parse(
                                      widget.active),
                                  'Death': double.parse(
                                      widget.death),
                                  'Recovery': double.parse(
                                     widget.recover)
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                  
                      const SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Covid-19 Today Case Updated',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blueGrey.shade700),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              formatted,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          TextContainer(
                              today:widget.todayCases,
                              deaths: 'Today Cases',
                              country: widget.country,
                              icon: const Icon(Icons.bar_chart_rounded,
                                  size: 45)),
                          TextContainer(
                              today: widget.todayDeaths,
                              deaths: 'Total Deaths',
                              country: widget.country,
                              icon: const Icon(
                                Icons.bed_sharp,
                                size: 45,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Center(
                        child: Text('More Static Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blueGrey)),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 214, 213, 213),
                                  Color.fromARGB(255, 241, 240, 240)
                                ])),
                        child: Column(
                          children: [
                            ResuableCard(
                                value: 'Active Cases',
                                data: widget.active,
                                color: Colors.green.shade500,
                                icon: Icon(Icons.refresh_rounded)),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Recovered',
                              data: widget.recover,
                              color: Colors.blue,
                              icon: Icon(Icons.schedule),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Total Tests',
                              data: widget.totalTests,
                              color: Colors.green,
                              icon: Icon(Icons.text_fields_rounded),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Test per One Million',
                              data:
                                  widget.testPerOneMillion,
                              color: Colors.blue,
                              icon: Icon(Icons.stacked_bar_chart),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Cases per one million',
                              data:widget.casesPerOneMillion,
                              color: Colors.teal,
                              icon: Icon(Icons.schedule),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Deaths per one million',
                              data:widget.deathsPerOneMillion,
                              color: Color.fromARGB(255, 77, 115, 133),
                              icon: Icon(MdiIcons.bed),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Critical Cases',
                              data: widget.criticalCases,
                              color: Colors.black,
                              icon: Icon(Icons.emergency_sharp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                }

                return const Center(
                    child: SpinKitDoubleBounce(
                  color: Colors.teal,
                  size: 50,
                ));
              })),
    );
  }
}
