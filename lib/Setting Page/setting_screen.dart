import 'package:flutter/material.dart';


import '../flutter_settings_ui.dart';
import 'languages_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings-screen';
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Legal इनोवेटर्स')),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: 'Common',
          tiles: [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              subtitleBelowTitle: true,
              leading: const Icon(Icons.language),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const LanguagesScreen(),
                ));
              },
            ),
            CustomTile(
              child: Container(
                color: const Color(0xFFEFEFF4),
                padding: const EdgeInsetsDirectional.only(
                  start: 14,
                  top: 12,
                  bottom: 30,
                  end: 14,
                ),
                child: Text(
                  'You can setup the language you want',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.5,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
            SettingsTile(
              title: 'Environment',
              subtitle: 'Production',
              leading: Icon(Icons.cloud_queue),
            ),
          ],
        ),
        SettingsSection(
          title: 'Account',
          tiles: [
            SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
            SettingsTile(title: 'Email', leading: Icon(Icons.email)),
            SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
          ],
        ),
        SettingsSection(
          title: 'Security',
          tiles: [
            SettingsTile.switchTile(
              title: 'Lock app in background',
              theme: const SettingsTileTheme(tileColor: Colors.green),
              leading: const Icon(Icons.phonelink_lock),
              switchValue: lockInBackground,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                  notificationsEnabled = value;
                });
              },
            ),
            SettingsTile.switchTile(
              title: 'Use fingerprint',
              subtitle: 'Allow application to access stored fingerprint IDs.',
              leading: const Icon(Icons.fingerprint),
              onToggle: (bool value) {},
              switchValue: false,
            ),
            SettingsTile.switchTile(
              title: 'Change password',
              leading: const Icon(Icons.lock),
              switchValue: true,
              onToggle: (bool value) {},
            ),
            SettingsTile.switchTile(
              title: 'Enable Notifications',
              subtitle: 'test',
              enabled: notificationsEnabled,
              leading: const Icon(Icons.notifications_active),
              switchValue: true,
              onToggle: (value) {},
            ),
          ],
        ),
        SettingsSection(
          title: 'Misc',
          tiles: [
            SettingsTile(
                title: 'Terms of Service', leading: Icon(Icons.description)),
            SettingsTile(
                title: 'Open source licenses',
                leading: Icon(Icons.collections_bookmark)),
          ],
        ),
        CustomSection(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 8),
                child: Image.asset(
                  'assets/setting.png',
                  height: 50,
                  width: 50,
                  color: const Color(0xFF777777),
                ),
              ),
              const Text(
                'Version: 1.0.0 ',
                style: TextStyle(color: Color(0xFF777777)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
