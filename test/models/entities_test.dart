import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quanttide/flutter_quanttide.dart';


void main() {
  group('Entity', () {
    test('fromJson() should deserialize JSON correctly', () {
      final json = {
        'id': 'd7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8',
        'createdAt': '2022-01-01T12:00:00.000Z',
        'updatedAt': '2022-01-02T12:00:00.000Z',
      };

      final entity = Entity.fromJson(json);

      expect(entity.id, 'd7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8');
      expect(entity.createdAt.toIso8601String(), '2022-01-01T12:00:00.000Z');
      expect(entity.updatedAt?.toIso8601String(), '2022-01-02T12:00:00.000Z');
    });

    test('toJson() should serialize to JSON correctly', () {
      final entity = Entity(
        id: 'd7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8',
        createdAt: DateTime.parse('2022-01-01T12:00:00.000Z'),
        updatedAt: DateTime.parse('2022-01-02T12:00:00.000Z'),
      );

      final json = entity.toJson();

      expect(json['id'], 'd7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8');
      expect(json['createdAt'], '2022-01-01T12:00:00.000Z');
      expect(json['updatedAt'], '2022-01-02T12:00:00.000Z');
    });
  });
}