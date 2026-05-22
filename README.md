# herry_app

Nabil Aqila Putra 123230085 IF-G



#catatan
1.untuk local_notification  
tambahakan di : android/app/src/main/AndroidManifest.xml  
dengan : 
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>  

2. Internet  
    <uses-permission android:name="android.permission.INTERNET"/>

3. tambahkan di android/app/build.gradle.kts
compileOptions {
    isCoreLibraryDesugaringEnabled = true
}
4. tambahkan di android/app/build.gradle.kts
dibawah Android
dependencies{
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}