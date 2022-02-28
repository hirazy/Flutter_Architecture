abstract class PreferenceManager{

  Future<String> getString(String key, {String defaultValue = ""});

  Future<bool> setString(String key, String value);

  Future<bool> remove(String key);

  Future<bool> clear();
}