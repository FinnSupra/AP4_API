<?php

declare(strict_types=1);

use App\Controllers\VisiteIndex;
use App\Controllers\Visites;
use App\Middleware\GetVisite;
use App\Middleware\GetVisiteInf;
use App\Controllers\Login;
use App\Middleware\RequireJWT;
use Slim\Routing\RouteCollectorProxy;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;


$app->group('/api', function (RouteCollectorProxy $group) {

    $group->get('/visites', [Visites::class, 'getAll']);

    $group->post('/visite', [Visites::class, 'create']);

    $group->group('', function (RouteCollectorProxy $group){

        $group->get('/visite/{id:[0-9]+}', Visites::class . ':show');

        $group->put('/visite/{id:[0-9]+}', Visites::class . ':update');

        $group->delete('/visite/{id:[0-9]+}', Visites::class . ':delete');
    })->add(GetVisite::class);
    
    // $group->group('', function (RouteCollectorProxy $group){
    //     $group->get('/visites/{idInf:[0-9]+}', Visites::class . ':showInf');
    // })->add(GetVisiteInf::class);
    $group->get('/visites/{idInf:[0-9]+}', Visites::class . ':showInf')
          ->add(GetVisiteInf::class);

})->add(RequireJWT::class);

$app->post('/login', [Login::class, 'connexion']);