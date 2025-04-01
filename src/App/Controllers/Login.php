<?php

declare(strict_types=1);

namespace App\Controllers;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use App\Repositories\loginRepository;
use Valitron\Validator;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$id;

class Login
{
    public function __construct(private loginRepository $repository, private Validator $validator)
    {
        $this->validator->mapFieldsRules([
            'login' =>['required'],
            'mdp' =>['required'],
        ]);
    }

    public function connexion(Request $request, Response $response): Response
    {
        $body = $request->getParsedBody();
        $this->validator = $this->validator->withData($body);

        $JWT = $this->repository->login($body);
        $response->getBody()->write($JWT);
        return $response;
    }
}