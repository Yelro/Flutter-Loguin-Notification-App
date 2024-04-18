import 'notif.dart';

class NotifBackend {
  /// Singleton pattern used here.
  static final NotifBackend _notifbackend = NotifBackend._internal();

  factory NotifBackend() {
    return _notifbackend;
  }

  NotifBackend._internal();

  /// Private list of notifications. Hardcoded here for testing purposes.
  final _notifs = [
    Notif(
      id: 1,
      from: 'security@company.com',
      subject: 'Bomb Threat Notification',
      dateTime: DateTime.now(),
      body: 'Dear employees,\n\nWe have received a bomb threat in our premises. Please evacuate the building immediately following the established emergency procedures. Do not attempt to use the elevators and stay away from the windows. The security team is investigating the situation and you will be informed further.\n\nPlease stay safe.\n\nBest regards,\nSecurity Team',
      image: 'images/bomb_threat.png',
    ),
    Notif(
      id: 2,
      from: 'emergency@government.com',
      subject: 'Tsunami Notification',
      dateTime: DateTime.now(),
      body: 'Dear residents,\n\nA tsunami alert has been issued for our coastal area. Please move to higher ground immediately and follow evacuation instructions provided by local authorities. Stay away from coastal areas, rivers, and estuaries until the all-clear is given.\n\nStay safe and follow updates from official sources.\n\nBest regards,\nEmergency Management Team',
      image: 'images/tsunami.png',
    ),
    Notif(
      id: 3,
      from: 'security@city.gov',
      subject: 'Terrorist Notification',
      dateTime: DateTime.now(),
      body: 'Dear citizens,\n\nWe have received credible intelligence regarding a potential terrorist threat in our city. Please remain vigilant and report any suspicious activities or packages to local law enforcement immediately. Avoid crowded places and follow instructions from authorities. Your safety is our top priority.\n\nStay safe,\nCity Security Department',
      image: 'images/terrorist.png',
    ),
    Notif(
      id: 4,
      read: true,
      from: 'forestservice@gov.org',
      subject: 'Wildfire Notification',
      dateTime: DateTime.now(),
      body: 'Attention residents,\n\nA wildfire alert has been issued for our area. Please stay informed about the situation through local news and official channels. Follow evacuation orders promptly and prepare to evacuate if necessary. If youre in an evacuation zone, dont delay, leave immediately.\n\nStay safe and cooperate with emergency responders.\n\nBest regards,\nForest Service',
      image: 'images/wildfire.png',
    ),
    Notif(
      id: 5,
      from: 'ranchmanagement@ranch.com',
      subject: 'Livestock Stampede Notification',
      dateTime: DateTime.now(),
      body: 'Attention ranchers,\n\nA livestock stampede has been reported in the vicinity. Please exercise caution and avoid the area until further notice. Secure your livestock and ensure the safety of your employees. Contact local authorities if assistance is needed.\n\nStay safe,\nRanch Management Team',
      image: 'images/livestock_stampede.png',
    ),
    Notif(
      id: 6,
      from: 'emergency@city.gov',
      subject: 'The Phenomenon of the Child Notification',
      dateTime: DateTime.now(),
      body: 'Attention residents,\n\nA flood alert has been issued for our area due to the phenomenon of the child. Higher than normal rainfall is expected, increasing the risk of flooding. Take precautions to protect yourself and your property. Stay informed through local news and official channels for updates and follow instructions from emergency authorities.\n\nStay safe,\nCity Emergency Management',
      image: 'images/phenomenon_child.png',
    ),
    Notif(
      id: 7,
      from: 'government@earth.gov',
      subject: 'Extraterrestrial Invasion Notification',
      dateTime: DateTime.now(),
      body: 'Attention citizens,\n\nAn extraterrestrial invasion alert has been issued. Reports indicate unidentified flying objects (UFOs) approaching our planet. Stay indoors, remain calm, and follow instructions from authorities. Emergency shelters are being set up in designated areas. Tune in to emergency broadcasts for updates and stay safe.\n\nBest regards,\nEarth Government',
      image: 'images/extraterrestrial_invasion.png',
    ),
    Notif(
      id: 8,
      from: 'healthdepartment@gov.org',
      subject: 'COVID Outbreak Notification',
      dateTime: DateTime.now(),
      body: 'Dear citizens,\n\nA COVID outbreak alert has been issued for our community. Its important to practice good hygiene, wear masks in public places, and maintain social distancing. If you experience symptoms such as fever, cough, or difficulty breathing, seek medical attention and get tested for COVID-19. Lets work together to stop the spread of the virus.\n\nStay safe,\nHealth Department',
      image: 'images/covid_outbreak.png',
    ),
    Notif(
      id: 9,
      from: 'government@country.gov',
      subject: 'Civil War Notification',
      dateTime: DateTime.now(),
      body: 'Attention citizens,\n\nA civil war alert has been issued for our country. Violence and unrest are escalating in various regions. Its important to stay indoors, avoid unnecessary travel, and remain vigilant. Follow instructions from local authorities and seek shelter in secure locations if necessary. Your safety is our top priority.\n\nBest regards,\nCountry Government',
      image: 'images/civil_war.png',
    ),
    Notif(
      id: 10,
      from: 'government@city.gov',
      subject: 'Curfew Notification',
      dateTime: DateTime(2020, 10, 26, 08, 54),
      body: 'Dear residents,\n\nA curfew alert has been issued for our city due to ongoing safety concerns. Effective immediately, all citizens are required to remain indoors from 10:00 PM to 6:00 AM until further notice. Exceptions will be made for essential workers and emergencies. Please comply with this directive for your safety and the safety of others.\n\nThank you for your cooperation,\nCity Government',
      image: 'images/curfew.png',
    ),
  ];

  ///
  /// Public API starts here :)
  ///

  /// Returns all enotifications.
  List<Notif> getNotifs() {
    return _notifs;
  }

  /// Marks notification identified by its id as read.
  void markNotifAsRead(int id) {
    final index = _notifs.indexWhere((notif) => notif.id == id);
    _notifs[index].read = true;
  }

  /// Deletes notification identified by its id.
  void deleteNotif(int id) {
    _notifs.removeWhere((notif) => notif.id == id);
  }
}
