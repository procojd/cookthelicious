// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addrecipemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddAdapter extends TypeAdapter<Add> {
  @override
  final int typeId = 0;

  @override
  Add read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Add()
      ..title = fields[0] as String?
      ..description = fields[1] as String?
      ..procedure = fields[2] as String?
      ..calories = fields[3] as String?
      ..imglink = fields[4] as String?
      ..ingredient = fields[5] as String?
      ..cookingtime = fields[6] as int?
      ..servings = fields[7] as int?;
  }

  @override
  void write(BinaryWriter writer, Add obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.procedure)
      ..writeByte(3)
      ..write(obj.calories)
      ..writeByte(4)
      ..write(obj.imglink)
      ..writeByte(5)
      ..write(obj.ingredient)
      ..writeByte(6)
      ..write(obj.cookingtime)
      ..writeByte(7)
      ..write(obj.servings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
