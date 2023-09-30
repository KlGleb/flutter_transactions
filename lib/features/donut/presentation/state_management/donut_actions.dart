import 'package:transactions/features/donut/presentation/state_management/donut_state.dart';

sealed class DonutAction {}

class DonutUpdated {
  DonutState data;

  DonutUpdated(this.data);
}
