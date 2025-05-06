import 'package:carbon_emission/models/request/transportation_request.dart';
import 'package:carbon_emission/models/response/carbon_emission_respone.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

// Cache to remain something stored
part 'api_service.g.dart';

@RestApi(baseUrl: "https://carbonsutra1.p.rapidapi.com")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST("/vehicle_estimate_by_type")
  Future<CarbonEmissionResponse> estimateVehicleEmission(
    @Body() TransportationRequest request,
    @Header("Authorization") String bearerToken,
    @Header("x-rapidapi-host") String apiHost,
    @Header("x-rapidapi-key") String apiKey,
  );
}
