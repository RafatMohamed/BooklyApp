// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAuthAdapter extends TypeAdapter<UserModelAuth> {
  @override
  final int typeId = 0;

  @override
  UserModelAuth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModelAuth(
      email: fields[0] as String?,
      password: fields[1] as String?,
      imageProfile: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModelAuth obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.imageProfile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAuthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
