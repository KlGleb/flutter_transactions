import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/util/transaction_type_name.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_state.dart';

class DonutScreen extends StatelessWidget {
  const DonutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DonutState>(
      converter: (store) => store.state.donutState,
      distinct: true,
      builder: (context, vm) => Builder(
        builder: (context) {
          if (vm.isEmpty) return const Center(child: CircularProgressIndicator());
          return Center(
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(8.0),
              child: PieChart(
                dataMap: vm.map((key, value) => MapEntry<String, double>(key.getName(context), value.toDouble())),
                chartType: ChartType.ring,
                legendOptions: const LegendOptions(legendPosition: LegendPosition.top),
                chartValuesOptions: const ChartValuesOptions(decimalPlaces: 0),
              ),
            ),
          );
        },
      ),
    );
  }
}
