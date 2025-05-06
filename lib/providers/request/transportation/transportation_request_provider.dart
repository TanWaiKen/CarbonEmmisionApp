import 'package:carbon_emission/data/transportation/distance_unit.dart';
import 'package:carbon_emission/data/transportation/fuel_type.dart';
import 'package:carbon_emission/data/transportation/vehicle_type.dart';
import 'package:carbon_emission/models/request/transportation_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transportation_request_provider.g.dart';

@riverpod
class TransportationRequestState extends _$TransportationRequestState {
  @override
  TransportationRequest build() {
    return TransportationRequest(
      vehicleType: VehicleType.carMedium,
      fuelType: FuelType.petrol,
      distanceValue: 0,
      distanceUnit: DistanceUnit.kilometers,
    );
  }

  void updateVehicleType(VehicleType vehicleType) {
    state = state.copyWith(vehicleType: vehicleType);
  }

  void updateFuelType(FuelType fuelType) {
    state = state.copyWith(fuelType: fuelType);
  }

  void updateDistanceValue(double distanceValue) {
    state = state.copyWith(distanceValue: distanceValue);
  }

  void updateDistanceUnit(DistanceUnit distanceUnit) {
    state = state.copyWith(distanceUnit: distanceUnit);
  }
}
