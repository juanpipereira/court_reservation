import '../dtos/precipitations_dto.dart';

import '../../domain/precipitations.dart';

extension PrecipitationsMapper on PrecipitationsDTO {
  Precipitations toModel() => Precipitations(percentage);
}
