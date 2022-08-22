import 'package:covid_tracker_app/model/world_states_model.dart';
import 'package:covid_tracker_app/services/states_services.dart';
import 'package:covid_tracker_app/views/countries_states_screen.dart';
import 'package:covid_tracker_app/widget/resuable_card.dart';
import 'package:covid_tracker_app/widget/text_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  StatesServices statesServices = StatesServices();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3));
  final colorList = [Colors.yellow, Colors.red, Colors.green];
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd-MM');
  final String formatted = formatter.format(now);

  @override
  void initState() {
    statesServices.fetchCountriesRecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: statesServices.fetchWorldStatesRecords(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Text('Covid 19 Globally Percentage',
                            style: TextStyle(
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
                                      snapshot.data!.active.toString()),
                                  'Death': double.parse(
                                      snapshot.data!.deaths.toString()),
                                  'Recovery': double.parse(
                                      snapshot.data!.recovered.toString())
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    CountriesStatesScreen()))),
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * .06,
                            width: MediaQuery.of(context).size.width * .75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.indigoAccent.shade100),
                            child: const Text('Track Countries',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
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
                              'Covid-19Today Case Updated',
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
                              today: snapshot.data!.todayCases.toString(),
                              deaths: 'Today Cases',
                              country: 'world',
                              icon: const Icon(Icons.bar_chart_rounded,
                                  size: 45)),
                          TextContainer(
                              today: snapshot.data!.todayDeaths.toString(),
                              deaths: 'Total Deaths',
                              country: 'world',
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
                                data: snapshot.data!.active.toString(),
                                color: Colors.green.shade500,
                                icon: Icon(Icons.refresh_rounded)),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Recovered',
                              data: snapshot.data!.recovered.toString(),
                              color: Colors.blue,
                              icon: Icon(Icons.schedule),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Total Tests',
                              data: snapshot.data!.tests.toString(),
                              color: Colors.green,
                              icon: Icon(Icons.text_fields_rounded),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Test per One Million',
                              data:
                                  snapshot.data!.testsPerOneMillion.toString(),
                              color: Colors.blue,
                              icon: Icon(Icons.stacked_bar_chart),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Cases per one million',
                              data:
                                  snapshot.data!.casesPerOneMillion.toString(),
                              color: Colors.teal,
                              icon: Icon(Icons.schedule),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Deaths per one million',
                              data:
                                  snapshot.data!.deathsPerOneMillion.toString(),
                              color: Color.fromARGB(255, 77, 115, 133),
                              icon: Icon(MdiIcons.bed),
                            ),
                            const Divider(height: 10.0, thickness: 2),
                            ResuableCard(
                              value: 'Critical Cases',
                              data: snapshot.data!.critical.toString(),
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
