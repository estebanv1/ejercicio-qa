function fn() {
  var env = karate.env;
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    autoId: null
  }
  if (env == 'dev') {
  } else if (env == 'e2e') {
  }
  return config;
}