String onCreate() => '''
  CREATE TABLE IF NOT EXISTS currency_history (
    id INTEGER PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT NOT NULL,
    from_currency TEXT NOT NULL,
    to_currency TEXT NOT NULL,
    from_value REAL NOT NULL,
    to_value REAL NOT NULL
  )
''';
