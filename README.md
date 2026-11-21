# AIJAZ AHMED & SONS CONSTRUCTION — Flutter starter app

This is a Flutter Android starter application with:
- Home and services screen
- Project portfolio placeholder screen
- Appointment form with the supplied weekly schedule validation
- Call and WhatsApp actions for both supplied phone numbers
- Google Maps search directions for the supplied business location

## Important current limitations

This first version is a **working front-end starter**, not yet a production multi-user business system. Appointment requests are validated on the device but are not saved or sent to an admin. Project cards are placeholders. Firebase authentication, cloud database, employee/customer/admin roles, image uploads, finance, notifications, and review moderation still need to be connected and implemented.

The appointment schedule follows the exact wording supplied:
- Monday–Thursday and Saturday–Sunday: after 6:00 PM (no closing time was specified)
- Friday: 10:00 AM through 5:00 PM

## Run on Windows 11

1. Install Flutter SDK and Android Studio.
2. Extract this project folder.
3. Open a terminal in this folder.
4. Run `flutter pub get`.
5. Connect an Android phone with USB debugging enabled, or start an Android emulator.
6. Run `flutter run`.
7. To build an APK later, run `flutter build apk --release`.

## Next setup needed

To make this a live business app, configure a Firebase project and add the generated `google-services.json` under `android/app/`. Then implement Firestore-backed appointment submissions and admin authentication. Do not publish until these features and access rules have been tested.
