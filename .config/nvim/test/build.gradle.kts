plugins {
  id("org.jetbrains.kotlin.jvm") version "1.3.71"
  id("org.jetbrains.gradle.plugin.idea-ext")
}

repositories {
  google()
  mavenCentral()
}

dependencies {
  implementation(platform("org.jetbrains.kotlin:kotlin-bom"))
  implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
}
