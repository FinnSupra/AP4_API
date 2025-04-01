<?php

declare(strict_types=1);

namespace App\Middleware;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use PSr\Http\Message\ResponseInterface as Response;
use Slim\Routing\RouteContext;
use App\Repositories\visiteRepository;
use Slim\Exception\HttpNotFoundException;

class GetVisite
{
    public function __construct(private VisiteRepository $repository)
    {
    }
    public function __invoke(Request $request, RequestHandler $handler): Response
    {
        $context = RouteContext::fromRequest($request);
        $route = $context->getRoute();
        $id = $route->getArgument('id');
            
        $visite = $this->repository->getById((int) $id);
        if ($visite == false){
            throw new HttpNotFoundException($request, message: 'Visite non trouvé');
        }
        
        $request = $request->withAttribute('visite', $visite);
        return $handler->handle($request);
    }
}