<?php

$filename = __DIR__.preg_replace('#(\?.*)$#', '', $_SERVER['REQUEST_URI']);

if (php_sapi_name() === 'cli-server' && is_file($filename)) {
    return false;
}

require_once __DIR__.'/vendor/autoload.php';

$loader = new Twig_Loader_Filesystem('views');
$twig = new Twig_Environment($loader);
$app = new Silex\Application();
$app->register(new DerAlex\Silex\YamlConfigServiceProvider(__DIR__ . '/config/config.yml'));

//Entrypoint Styleguide
$app->get('/', function() use($app, $twig) {
  return $twig->render(
    'index.html.twig',
    array(
    	'app' => $app,
    )
  );
});

$app->run();