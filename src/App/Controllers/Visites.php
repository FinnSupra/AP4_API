<?php

declare(strict_types=1);

namespace App\Controllers;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use App\Repositories\visiteRepository;
use Valitron\Validator;
use App\Controllers\Login;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class Visites
{
    public function __construct(private visiteRepository $repository,
                                private Validator $validator)
    {
        $this->validator->mapFieldsRules([
            'patient' =>['required'],
            'infimiere' =>['required'], 
            'date_prevue' =>['required'],
            'duree' =>['required'],

        ]);
    }
    public function getJWTID(Request $request, Response $response)
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
    public function getAll(Request $request, Response $response): Response
    {
        $JWT = $this->getJWTID($request, $response);
        if ($JWT['id'] == 2 || $JWT['id'] == 4)
        {
            $data = $this->repository->getAll();
            $body = json_encode($data);
            $response->getBody()->write("$body");
        }
        if ($JWT['id'] == 1)
        {
            $data = $this->repository->getByInf((int) $JWT['idPers']);
            $body = json_encode($data);
            $response->getBody()->write("$body");
        }
        if ($JWT['id'] == 3)
        {
            $data = $this->repository->getByPat((int) $JWT['idPers']);
            $body = json_encode($data);
            $response->getBody()->write("$body");
        }
        return $response;
    }
    public function show(Request $request, Response $response, string $id): Response
    {
        $visite = $request->getAttribute('visite');
        $body = json_encode($visite);
        $response->getBody()->write($body);
        return $response;
    }
    public function showInf(Request $request, Response $response, string $id): Response
    {
        $visite = $request->getAttribute('visite');
        $body = json_encode($visite);
        $response->getBody()->write($body);
        return $response;
    }
    public function create(Request $request, Response $response): Response
    {
        $body = $request->getParsedBody();
        $this->validator = $this->validator->withData($body);
        $id = $this->repository->create($body);
        $body = json_encode([
            'message' => 'Visite créée',
            'id' => $id
        ]);
        $response->getBody()->write($body);
        return $response->withStatus(201);
    }
    public function update(Request $request, Response $response, string $id): Response
    {
        $body = $request->getParsedBody();
        $this->validator = $this->validator->withData($body);
        $rows = $this->repository->update((int) $id, $body);
        $body = json_encode([
            'message' => 'Visite modifié',
            'rows' => $rows
        ]);
        $response->getBody()->write($body);
        return $response;
    }
    public function delete(Request $request, Response $response, string $id): Response
    {
        $rows = $this->repository->delete($id);
        $body = json_encode([
            'message' => 'Visite supprimé',
            'rows' => $rows
        ]);
        $response->getBody()->write($body);
        return $response;
    }
}