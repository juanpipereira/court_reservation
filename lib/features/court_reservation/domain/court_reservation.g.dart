// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_reservation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourtReservationAdapter extends TypeAdapter<CourtReservation> {
  @override
  final int typeId = 1;

  @override
  CourtReservation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourtReservation(
      courtName: fields[0] as String,
      date: fields[1] as DateTime,
      id: fields[2] as int,
      precipitations: fields[3] as Precipitations,
      userName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CourtReservation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.courtName)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.precipitations)
      ..writeByte(4)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourtReservationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
