# ProAim Engine Security Rules
-keep class com.proaim.engine.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class org.opencv.** { *; }
-keep class org.tensorflow.lite.** { *; }

# Obfuscate core logic
-repackageclasses ''
-allowaccessmodification
-overloadaggressively

# Optimization
-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontpreverify
-verbose

# Protect native method names
-keepclasseswithmembernames class * {
    native <methods>;
}

# Human Error Algorithm Protection
-keep class com.proaim.engine.HumanError { *; }
