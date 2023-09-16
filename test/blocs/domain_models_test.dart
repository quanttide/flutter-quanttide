import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quanttide/flutter_quanttide.dart';


void main() {
  group('DomainModel', () {
    test('fromJson() should deserialize JSON correctly', () {
      final json = {
        'id': 'd7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8',
        'createdAt': '2022-01-01T12:00:00.000Z',
        'updatedAt': '2022-01-02T12:00:00.000Z',
      };

      final model = DomainModel.fromJson(json);

      expect(model.id, 'd7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8');
      expect(model.createdAt, DateTime.utc(2022, 1, 1, 12, 0, 0));
      expect(model.updatedAt, DateTime.utc(2022, 1, 2, 12, 0, 0));
    });

    test('toJson() should serialize to JSON correctly', () {
      final model = DomainModel(
        id: 'd7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8',
        createdAt: DateTime.utc(2022, 1, 1, 12, 0, 0),
        updatedAt: DateTime.utc(2022, 1, 2, 12, 0, 0),
      );

      final json = model.toJson();

      expect(json['id'], 'd7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8');
      expect(json['createdAt'], '2022-01-01T12:00:00.000Z');
      expect(json['updatedAt'], '2022-01-02T12:00:00.000Z');
    });
  });
}