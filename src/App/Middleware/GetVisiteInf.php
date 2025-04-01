<?php

declare(strict_types=1);

namespace App\Middleware;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use PSr\Http\Message\ResponseInterface as Response;
use Slim\Routing\RouteContext;
use App\Repositories\visiteRepository;
use Slim\Exception\HttpNotFoundException;
use Slim\Exception\HttpForbiddenException;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class GetVisiteInf
{
    public function __construct(private VisiteRepository $repository)
    {
    }
    public function __invoke(Request $request, RequestHandler $handler): Response
    {
        $context = RouteContext::fromRequest($request);
        $route = $context->getRoute();
        $idInf = $route->getArgument('idInf');

        $visite = $this->repository->getByInf((int) $idInf);
        if ($visite == false){
            throw new HttpNotFoundException($request, message: 'Aucune visite pour cette infirmière');
        }
        $JWT = $this->getJWTID($request);
        if ($JWT['id'] != 2) {
            throw new HttpForbiddenException($request, message: 'Vous n\'avez pas le rôle nécessaire pour cette requête');
        }
        $request = $request->withAttribute('visite', $visite);
        return $handler->handle($request);
    }
    public function getJWTID(Request $request)
    {
        $authHeader = $request->getHeaderLine('Authorization');

        if (empty($authHeader) || !preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
            throw new \Exception('Token JWT manquant ou invalide');
        }
        $jwt = $matches[1];
        try {
            $key = 'BTS-SIO';
            $decoded = JWT::decode($jwt, new Key($key, 'HS256'));
            $idPers = $decoded->idPers;
            $id = $decoded->id;
            return [
                'idPers' => $idPers,
                'id' => $id
            ];
        }
        catch (ExpiredException $e){
             return;
        }
    }
}