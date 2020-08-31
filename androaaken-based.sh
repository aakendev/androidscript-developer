#!/bin/bash

echo "################################################"
echo "###       ANDROID PROJECT by AAKENDEV        ###"
echo "###   CODED 30 AUG 2020 - APACHE LICENSED    ###"
echo "################################################"
echo "Setting Enviroment..."
printf "(1) Kindly Please Input Project Folder Name (This Will Erase All Contents of Folder, Please Made Backup First !!!): " && read projectFolderName
echo "You're Project Name is $projectFolderName"
echo "Make $projectFolderName Folder..."
cd ~
if [[ -e "$HOME/$projectFolderName" ]]; then
	echo "Folder $projectFolderName Already Exists..."
	echo "Rebuilding The Project Folder..."
	rm -r $HOME/$projectFolderName
	mkdir $HOME/$projectFolderName
else
	echo "Folder $projectFolderName Not Yet Available, Creating the New One..."
	mkdir $HOME/$projectFolderName
fi
echo "Go To $projectFolderName Folder..."
cd $HOME/$projectFolderName
echo "Make settings.gradle in Parent..."
touch settings.gradle
echo "Make settings.gradle default template..."
printf "include \':app\'\nrootProject.name = \"AAKEN Developer Kotlin Template\"" > settings.gradle
echo "Make gradle.properties in Parent..."
touch gradle.properties
echo "Make gradle.properties default template..."
printf "org.gradle.jvmargs=-Xmx1024m\nandroid.useAndroidX=true\nandroid.enableJetifier=true\nkotlin.code.style=official" > gradle.properties
echo "Make local.properties in Parent..."
touch local.properties
echo "Make local.properties default template..."
printf "sdk.dir=\$ANDROID_SDK_ROOT" > local.properties
echo "Make build.gradle in Parent..."
touch build.gradle
echo "Make build.gradle default template..."
printf "buildscript {\n\text.kotlin_version = \"1.4.0\"\n\trepositories {\n\t\tgoogle()\n\t\tjcenter()\n\t}\n\tdependencies {\n\t\tclasspath \"com.android.tools.build:gradle:4.0.1\"\n\t\tclasspath \"org.jetbrains.kotlin:kotlin-gradle-plugin:\$kotlin_version\"\n\t}\n}\n\nallprojects {\n\trepositories {\n\t\tgoogle()\n\t\tjcenter()\n\t}\n}\n\ntask clean(type: Delete) {\n\tdelete rootProject.buildDir\n}" > build.gradle
printf "(2) Kindly Please Inform Your Package Name (ex: com.android.example): " && read packageName
echo "You're Package Name is $packageName"
packageNameOne=$(echo $packageName | cut -d "." -f 1)
packageNameTwo=$(echo $packageName | cut -d "." -f 2)
packageNameThree=$(echo $packageName | cut -d "." -f 3)
echo "Make $packageName Folder Structure..."
echo "Rebuilding Folder Structure..."
mkdir -p $HOME/$projectFolderName/app/libs                                                                                                     
mkdir -p $HOME/$projectFolderName/app/src/main/java/$packageNameOne/$packageNameTwo/$packageNameThree                                          
mkdir -p $HOME/$projectFolderName/app/src/main/res                                                                                             
mkdir -p $HOME/$projectFolderName/app/src/main/res/drawable                                                                                    
mkdir -p $HOME/$projectFolderName/app/src/main/res/layout                                                                                      
mkdir -p $HOME/$projectFolderName/app/src/main/res/values
echo "Make Structure of Gradle"
cd $HOME/$projectFolderName/app
echo "Creating build.gradle"
touch build.gradle
echo "Creating default build.gradle"
printf "apply plugin: \'com.android.application\'\napply plugin: \'kotlin-android\'\napply plugin: \'kotlin-android-extensions\'\n\nandroid {\n\tcompileSdkVersion 30\n\tbuildToolsVersion \"30.0.2\"\n\n\tdefaultConfig {\n\t\tapplicationId \"$packageName\"\n\t\tminSdkVersion 16\n\t\ttargetSdkVersion 30\n\t\tversionCode 1\n\t\tversionName \"1.0\"\n\t}\n\n\tbuildTypes {\n\t\trelease {\n\t\t\tminifyEnabled true\n\t\t\tproguardFiles getDefaultProguardFile(\'proguard-android-optimize.txt\'), \'proguard-rules.pro\'\n\t\t}\n\t}\n}\n\ndependencies {\n\timplementation fileTree(dir: \"libs\", include: [\"*.jar\"])\n\timplementation \"org.jetbrains.kotlin:kotlin-stdlib:\$kotlin_version\"\n\timplementation \'androidx.core:core-ktx:1.3.1\'\n\timplementation \'androidx.appcompat:appcompat:1.2.0\'\n\timplementation \'androidx.constraintlayout:constraintlayout:1.1.3\'\n}" > build.gradle
echo "Creating proguard-rules.pro"
touch proguard-rules.pro
echo "Creating DUMMY proguard-rules.pro"
printf "#DUMMY FILE" > proguard-rules.pro
echo "Make Structure of XML and Java/Kotlin..."
cd $HOME/$projectFolderName/app/src/main
echo "Creating AndroidManifest.xml"
touch AndroidManifest.xml
echo "Creating default AndroidManifest.xml"
printf "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"\n\tpackage=\"$packageName\">\n\n\t<application\n\t\tandroid:allowBackup=\"true\"\n\t\tandroid:icon=\"@drawable/ic_launcher\"\n\t\tandroid:label=\"@string/app_name\"\n\t\tandroid:roundIcon=\"@drawable/ic_launcher\"\n\t\tandroid:supportsRtl=\"true\"\n\t\tandroid:theme=\"@style/AppTheme\">\n\t\t<activity android:name=\".MainActivity\">\n\t\t\t<intent-filter>\n\t\t\t\t<action android:name=\"android.intent.action.MAIN\" />\n\t\t\t\t<category android:name=\"android.intent.category.LAUNCHER\" />\n\t\t\t</intent-filter>\n\t\t</activity>\n\t</application>\n</manifest>" > AndroidManifest.xml
cd $HOME/$projectFolderName/app/src/main/java/$packageNameOne/$packageNameTwo/$packageNameThree
echo "Creating MainActivity.kt"
touch MainActivity.kt
echo "Creating default MainActivity.kt"
printf "package $packageName\n\nimport androidx.appcompat.app.AppCompatActivity\nimport android.os.Bundle\n\nclass MainActivity : AppCompatActivity() {\n\toverride fun onCreate(savedInstanceState: Bundle?) {\n\t\tsuper.onCreate(savedInstanceState)\n\t\tsetContentView(R.layout.activity_main)\n\t}\n}" > MainActivity.kt
cd $HOME/$projectFolderName/app/src/main/res
echo "Creating activity_main.xml"
touch layout/activity_main.xml
echo "Creating default activity_main.xml"
printf "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n<androidx.constraintlayout.widget.ConstraintLayout xmlns:android=\"http://schemas.android.com/apk/res/android\"\n\txmlns:app=\"http://schemas.android.com/apk/res-auto\"\n\txmlns:tools=\"http://schemas.android.com/tools\"\n\tandroid:layout_width=\"match_parent\"\n\tandroid:layout_height=\"match_parent\"\n\ttools:context=\".MainActivity\">\n\n\t<TextView\n\t\tandroid:layout_width=\"wrap_content\"\n\t\tandroid:layout_height=\"wrap_content\"\n\t\tandroid:text=\"Hello Kotlin\"\n\t\tapp:layout_constraintTop_toTopOf=\"parent\"\n\t\tapp:layout_constraintRight_toRightOf=\"parent\"\n\t\tapp:layout_constraintBottom_toBottomOf=\"parent\"\n\t\tapp:layout_constraintLeft_toLeftOf=\"parent\" />\n\n</androidx.constraintlayout.widget.ConstraintLayout>" > layout/activity_main.xml
echo "Creating strings.xml"
touch values/strings.xml
echo "Creating default strings.xml"
printf "<resources>\n\t<string name=\"app_name\">AAKEN Developer Kotlin Template</string>\n</resources>" > values/strings.xml
echo "Creating colors.xml"
touch values/colors.xml
echo "Creating default colors.xml"
printf "<?xml version =\"1.0\" encoding=\"utf-8\" ?>\n<resources>\n\t<color name=\"colorPrimary\">#6200EE</color>\n\t<color name=\"colorPrimaryDark\">#3700B3</color>\n\t<color name=\"colorAccent\">#03DAC5</color>\n</resources>" > values/colors.xml
echo "Creating styles.xml"
touch values/styles.xml
echo "Creating default styles.xml"
printf "<resources>\n\t<style name=\"AppTheme\" parent=\"Theme.AppCompat.Light.DarkActionBar\">\n\t\t<item name=\"colorPrimary\">@color/colorPrimary</item>\n\t\t<item name=\"colorPrimaryDark\">@color/colorPrimaryDark</item>\n\t\t<item name=\"colorAccent\">@color/colorAccent</item>\n\t</style>\n</resources>" > values/styles.xml
echo "Creating Default Drawables"
sudo apt-get update
sudo apt-get install wget
cd $HOME/$projectFolderName/app/src/main/res/drawable
wget "https://aaken-technology.site/ftp/ic_launcher.png"
