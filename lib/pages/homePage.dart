import 'package:covid19/controller/world_state_report.dart';
import 'package:covid19/model/woldStateModel.dart';
import 'package:covid19/pages/countriesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // ignore: unused_field
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 3))
    ..repeat();

  List<Color> list = const [
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {
    WorldStateReport data = WorldStateReport();
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar( 
        toolbarHeight: 90,
        backgroundColor: 
        const Color.fromARGB(255, 113, 157, 240),
        centerTitle: true,
        title: const Row(
          children: [
            Icon(
              Icons.coronavirus,
              color: Color(0xffde5246),
            ),
            Text(
              'Covid-19 World Status',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: FutureBuilder<WorldStateModel>(
              future: data.worldStateReport(),
              builder: (BuildContext context,
                  AsyncSnapshot<WorldStateModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.black,
                      controller: _controller,
                      size: 50,
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height / 40,
                        ),
                        PieChart(
                            chartRadius: size.width / 2.5,
                            chartType: ChartType.ring,
                            colorList: list,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            dataMap: {
                              'Total':
                                  double.parse(snapshot.data!.cases.toString()),
                              'Recovered': double.parse(
                                  snapshot.data!.recovered.toString()),
                              'Deth': double.parse(
                                  snapshot.data!.deaths!.toString()),
                            }),
                        SizedBox(
                          height: size.height / 15,
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 30, left: 30, bottom: 10),
                            child: Column(
                              children: [
                                ReuseabalRow(
                                  title: 'Total',
                                  value: '${snapshot.data!.cases!}',
                                ),
                                ReuseabalRow(
                                  title: 'Deaths',
                                  value: '${snapshot.data!.deaths!}',
                                ),
                                ReuseabalRow(
                                  title: 'Recovered',
                                  value: '${snapshot.data!.recovered!}',
                                ),
                                ReuseabalRow(
                                  title: 'Active',
                                  value: '${snapshot.data!.active!}',
                                ),
                                ReuseabalRow(
                                  title: 'Critical',
                                  value: '${snapshot.data!.critical!}',
                                ),
                                ReuseabalRow(
                                  title: 'ToDay Deaths',
                                  value: '${snapshot.data!.todayDeaths!}',
                                ),
                                ReuseabalRow(
                                  title: 'ToDay Recovered',
                                  value: '${snapshot.data!.todayRecovered!}',
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CountriesPage()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height / 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 113, 157, 240),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              'Country Tracker',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              })),
    );
  }
}

// ignore: must_be_immutable
class ReuseabalRow extends StatelessWidget {
  String title, value;
  ReuseabalRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height / 40,
        ),
      ],
    );
  }
}
