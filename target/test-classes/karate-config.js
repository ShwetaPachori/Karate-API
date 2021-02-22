function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    
	ApiUrl:'https://conduit.productionready.io/api/'
  }
  if (env == 'dev') {

    config.email = 'karatetestuser@gmail.com'
    config.password = 'karatetestuser'

  } else if (env == 'e2e') {

    config.email = "karatetestuser@gmail.com"
    config.password = "karatetestuser"
  }
  
  var accessToken = karate.callSingle('classpath:src/test/java/conduit/helpers/CreateToken.feature',config).authToken
  karate.configure('headers',{Authorization: 'Token '+accessToken})

  return config;
}