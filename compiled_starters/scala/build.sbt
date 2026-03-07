ThisBuild / scalaVersion     := "3.8.2"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "com.codecrafters"
ThisBuild / organizationName := "CodeCrafters"

assembly / assemblyJarName := "interpreter.jar"

lazy val root = (project in file("."))
  .settings(
    name := "codecrafter-interpreter",
    // List your dependencies here
    libraryDependencies ++= Seq(
    )
  )
