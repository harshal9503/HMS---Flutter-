import 'dart:async';

class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Mock user database (replace with real API/DB)
  final Map<String, Map<String, dynamic>> _mockUsers = {
    'doctor': {
      'password': 'doctor123',
      'module': 'Doctor',
      'name': 'Dr. John Smith',
    },
    'reception': {
      'password': 'reception123',
      'module': 'Reception',
      'name': 'Sarah Johnson',
    },
    'nurse': {
      'password': 'nurse123',
      'module': 'Nurses',
      'name': 'Emily Davis',
    },
    'pharmacy': {
      'password': 'pharmacy123',
      'module': 'Pharmacy',
      'name': 'Michael Brown',
    },
    'lab': {
      'password': 'lab123',
      'module': 'Laboratory',
      'name': 'Robert Wilson',
    },
    'admin': {
      'password': 'admin123',
      'module': 'Admin',
      'name': 'Admin User',
    },
    'patient': {
      'password': 'patient123',
      'module': 'Patient',
      'name': 'Patient User',
    },
  };

  Future<Map<String, dynamic>> login(
    String username,
    String password,
    String module,
  ) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Check if user exists and module matches
    if (_mockUsers.containsKey(username.toLowerCase())) {
      final user = _mockUsers[username.toLowerCase()]!;
      if (user['password'] == password && user['module'] == module) {
        return {
          'success': true,
          'user': user,
          'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
        };
      }
    }

    throw Exception('Invalid credentials or module access');
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  bool isLoggedIn() {
    // Check if user is logged in (from shared preferences or secure storage)
    return false;
  }

  Future<Map<String, dynamic>> getUser() async {
    // Get current user data
    await Future.delayed(const Duration(milliseconds: 500));
    return {};
  }
}
