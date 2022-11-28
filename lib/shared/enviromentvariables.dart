class EnvVariables {
  static const SUPABASE_URL = "SUPABASE_URL";
  static const ANONKEY = "KEY";
}



enum ENVIROMENT { prod, dev, homol }

extension Env on ENVIROMENT {
  String get SUPABASE_URL {
    switch (this) {
      case ENVIROMENT.dev:
        return "https://jrktmpcvgwnupwrobutr.supabase.co";
      default:
        return "";
    }
  }

  String get ANONKEY {
    switch (this) {
      case ENVIROMENT.dev:
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impya3RtcGN2Z3dudXB3cm9idXRyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg5NjgwNDIsImV4cCI6MTk4NDU0NDA0Mn0.gQ4MIsvWyADvm70o6fB2JxMczE6rmP5Gukd9MHztPic";
      default:
        return "";
    }
  }

  String get DATABASE_PASSWORD {
    switch (this) {
      case ENVIROMENT.dev:
        return "RbXm9V7aMS4rWxv0";
      default:
        return "";
    }
  }
}
