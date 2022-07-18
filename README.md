## Getting Started

1. Install flutter https://docs.flutter.dev/get-started/install
2. Setup flutter firebase https://firebase.google.com/docs/flutter/setup?platform=ios:
3. Update the following android folder files:
3.1 android > build.gradle 

```buildscript {

  repositories {

    // Check that you have the following line (if not, add it):

    google()  // Google's Maven repository

  }

  dependencies {

    ...

    // Add this line

    classpath 'com.google.gms:google-services:4.3.13'

  }

}


allprojects {

  ...

  repositories {

    // Check that you have the following line (if not, add it):

    google()  // Google's Maven repository

    ...

  }

}
```

3.2 android > app > build.gradle

```apply plugin: 'com.android.application'

// Add this line

apply plugin: 'com.google.gms.google-services'


dependencies {

  // Import the Firebase BoM

  implementation platform('com.google.firebase:firebase-bom:30.2.0')


  // Add the dependencies for the desired Firebase products

  // https://firebase.google.com/docs/android/setup#available-libraries

}
```

4. Download `google-services.json` from: firebase project > overview > project settings > General > Add app 
4.1 Add `google-service.json` file to android > app > google-services.json
5. Have a virtual iOS or Android device create or a physical connected mobile device 
6. From project folder run `flutter run`



