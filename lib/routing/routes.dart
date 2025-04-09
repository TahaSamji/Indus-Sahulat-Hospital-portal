enum Routes{
  home('/'),
  authLogin('/auth/login'),
  authSignup('/auth/signup'),
  authWrapper('/auth/authWrapper'),
  eventPage('/event/allevents'),
  ambulanceAssign('/event/assignAmbulance');


  final String path;
  const Routes(this.path);
}