import 'package:covid_tracker_app/services/states_services.dart';
import 'package:covid_tracker_app/views/country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class CountriesStatesScreen extends StatefulWidget {
  const CountriesStatesScreen({super.key});

  @override
  State<CountriesStatesScreen> createState() => _COuntryState();
}

class _COuntryState extends State<CountriesStatesScreen> {
  final StatesServices _statesServices = StatesServices();
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Search By Country Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _statesServices.fetchCountriesRecord(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          String name = snapshot.data![index]['country'];
                          if (_searchController.text.isEmpty) {
                            return GestureDetector(
                              onTap: () {
                                final String country =
                                    snapshot.data![index]['country'];
                                final String active =
                                    snapshot.data![index]['active'].toString();
                                final String death =
                                    snapshot.data![index]['deaths'].toString();
                                final String recover = snapshot.data![index]
                                        ['recovered']
                                    .toString();
                                final String todayCases = snapshot.data![index]
                                        ['todayCases']
                                    .toString();
                                final String todayDeaths = snapshot.data![index]
                                        ['todayDeaths']
                                    .toString();
                                final String totalTests = snapshot.data![index]
                                        ['totalTests']
                                    .toString();
                                final String testPerOneMillion = snapshot
                                    .data![index]['testPerOneMillion']
                                    .toString();
                                final String casesPerOneMillion = snapshot
                                    .data![index]['casesPerOneMillion']
                                    .toString();
                                final String deathsPerOneMillion = snapshot
                                    .data![index]['deathsPerOneMillion']
                                    .toString();
                                final String criticalCases = snapshot
                                    .data![index]['criticalCases']
                                    .toString();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => CountryRecord(
                                            country: country,
                                            active: active,
                                            death: death,
                                            recover: recover,
                                            todayCases: todayCases,
                                            todayDeaths: todayDeaths,
                                            totalTests: totalTests,
                                            testPerOneMillion:
                                                testPerOneMillion,
                                            casesPerOneMillion:
                                                casesPerOneMillion,
                                            deathsPerOneMillion:
                                                deathsPerOneMillion,
                                            criticalCases: criticalCases))));
                              },
                              child: ListTile(
                                leading: Image(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                    width: 50,
                                    height: 50),
                                title: Text(
                                  snapshot.data![index]['country'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                subtitle: Text(
                                  'Total Cases\r\r\r' +
                                      snapshot.data![index]['cases'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                trailing:
                                    const Icon(Icons.navigate_next_rounded),
                              ),
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase())) {
                            return GestureDetector(
                              onTap: () {
                                final String country =
                                    snapshot.data![index]['country'];
                                final String active =
                                    snapshot.data![index]['active'].toString();
                                final String death =
                                    snapshot.data![index]['deaths'].toString();
                                final String recover = snapshot.data![index]
                                        ['recovered']
                                    .toString();
                                final String todayCases = snapshot.data![index]
                                        ['todayCases']
                                    .toString();
                                final String todayDeaths = snapshot.data![index]
                                        ['todayDeaths']
                                    .toString();
                                final String totalTests = snapshot.data![index]
                                        ['totalTests']
                                    .toString();
                                final String testPerOneMillion = snapshot
                                    .data![index]['testPerOneMillion']
                                    .toString();
                                final String casesPerOneMillion = snapshot
                                    .data![index]['casesPerOneMillion']
                                    .toString();
                                final String deathsPerOneMillion = snapshot
                                    .data![index]['deathsPerOneMillion']
                                    .toString();
                                final String criticalCases = snapshot
                                    .data![index]['criticalCases']
                                    .toString();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => CountryRecord(
                                            country: country,
                                            active: active,
                                            death: death,
                                            recover: recover,
                                            todayCases: todayCases,
                                            todayDeaths: todayDeaths,
                                            totalTests: totalTests,
                                            testPerOneMillion:
                                                testPerOneMillion,
                                            casesPerOneMillion:
                                                casesPerOneMillion,
                                            deathsPerOneMillion:
                                                deathsPerOneMillion,
                                            criticalCases: criticalCases))));
                              },
                              child: ListTile(
                                leading: Image(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                    width: 50,
                                    height: 50),
                                title: Text(
                                  snapshot.data![index]['country'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                subtitle: Text(
                                  'Total Cases\r\r\r' +
                                      snapshot.data![index]['cases'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                trailing:
                                    const Icon(Icons.navigate_next_rounded),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }));
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: SpinKitWave(
                        color: Colors.teal,
                      ),
                    );
                  } else {
                    return Text(snapshot.hasError.toString());
                  }
                }),
              ),
            ),
          ],
        )));
  }
}
