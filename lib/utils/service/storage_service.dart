import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {

  StorageService._internal();

  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;


  static const String _boxName = 'secureStorageBox';
  static const String _jwtKey = "auth_token";
  late Box _box;

  /// Initialize Hive and open the encrypted box.
  /// Call this once before using the service (e.g., in `main()`).
  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path); // Initialize Hive with a storage path
    final dir = await getApplicationDocumentsDirectory();
    print('Hive storage path: ${dir.path}'); // Log the path
    // Optional: Use encryption for sensitive data (uncomment if needed)
    // const encryptionKey = 'your-32-byte-encryption-key'; // Must be 32 chars
    // final cipher = HiveAesCipher(encryptionKey.codeUnits);

    _box = await Hive.openBox(
      _boxName,
      // encryptionCipher: cipher, // Uncomment to enable encryption
    );
  }

  /// Save the JWT token to Hive.
  Future<void> saveToken(String token) async {
    await _box.put(_jwtKey, token);
  }

  /// Retrieve the JWT token from Hive.
  Future<String?> getToken() async {
    return _box.get(_jwtKey);
  }

  /// Delete the JWT token.
  Future<void> deleteToken() async {
    await _box.delete(_jwtKey);
  }

  /// Close the Hive box when done (optional).
  Future<void> close() async {
    await _box.close();
  }
}