class ServerException implements Exception {
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServerException;
  }

  @override
  int get hashCode {
    return hashCode;
  }
}
