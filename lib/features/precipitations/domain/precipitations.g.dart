// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'precipitations.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrecipitationsAdapter extends TypeAdapter<Precipitations> {
  @override
  final int typeId = 2;

  @override
  Precipitations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Precipitations(
      fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Precipitations obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.percentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrecipitationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
