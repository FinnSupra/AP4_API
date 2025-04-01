<?php

declare(strict_types=1);

namespace App\Middleware;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Psr\Http\Message\ResponseInterface as Response;
use Slim\Psr7\Factory\ResponseFactory;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException;


class RequireJWT
{
    public function __construct(private ResponseFactory $factory)
    {
    }

    public function __invoke(Request $request, RequestHandler $handler): Response
    {
        // Récupérer l'en-tête Authorization
        $authHeader = $request->getHeaderLine('Authorization');

        // Vérifier si le header est présent et commence par "Bearer "
        if (empty($authHeader) || !preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
            return $this->factory->createResponse(400);
        }

        // Extraire le token JWT
        $jwt = $matches[1];


        
        try {
            // Clé secrète utilisée pour encoder le JWT
            $key = 'BTS-SIO';

            // Décoder et valider le JWT
            $decoded = JWT::decode($jwt, new Key($key, 'HS256'));

            // Ajouter les informations du JWT à la requête pour qu'elles soient accessibles dans les contrôleurs
            $request = $request->withAttribute('JWT', $decoded);

            // Passer la requête au prochain middleware ou au contrôleur
            return $handler->handle($request);
        } catch (\Exception $e) {
            return $this->factory->createResponse(401);
        }

        
        // } catch (ExpiredException $e) {
        //     error_log('JWT expired: ' . $e->getMessage());
        //     return $this->factory->createResponse()->withStatus(401);
        // } catch (SignatureInvalidException $e) {
        //     error_log('Invalid JWT signature: ' . $e->getMessage());
        //     return $this->factory->createResponse()->withStatus(401);
        // } catch (\Exception $e) {
        //     error_log('JWT validation error: ' . $e->getMessage());
        //     return $this->factory->createResponse()->withStatus(401);
        // }
    }
}