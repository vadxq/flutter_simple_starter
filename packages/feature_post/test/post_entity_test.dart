import 'package:flutter_test/flutter_test.dart';

import '../lib/feature_post.dart';

void main() {
  test('PostEntity should keep id/title/body values', () {
    const post = PostEntity(id: 1, title: 't', body: 'b');

    expect(post.id, 1);
    expect(post.title, 't');
    expect(post.body, 'b');
  });
}
